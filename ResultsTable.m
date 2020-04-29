% An impoved table data structure for SPDLab results.
% By Resul Al @DTU
classdef ResultsTable 
    properties
        Table table
        OutputNames cell
    end
    methods
        function obj = ResultsTable(varargin)
            OutputNames = {'COD','TSS','SNO','SNH','TN','EQI','Sludge','GHGe','AirEnergy','Methane'};
            obj.OutputNames = OutputNames;
            if nargin<1, obj.Table = rs_bigT(); end
            if nargin==1 && isnumeric(varargin{1}) % Y is passed
                obj.Table = array2table(varargin{1}, 'VariableNames', OutputNames);
            end

            if nargin==1 && istable(varargin{1}) % T is passed
                obj.Table = varargin{1};
                obj.OutputNames = obj.Table.Properties.VariableNames;
            end
        end

        function T = addSolutionID(obj,d)
            T=obj.Table;
            T.SolutionID = strseq(sprintf('d_%d_r_',d),1:100);
            T = T(:,[end 1:end-1]);
        end

        function bigT = status(obj) % Returns a new ResultsTable satisfying EQ Limits by adding a new column named Status to the end
            T=obj.Table;
            T.Status = strings(height(T),1); % an empty string array

            for row=1:height(T)
                if ~any(T{row,obj.OutputNames}) % a zero line detected
                    T.Status(row) = 'ZeroLine';
                end
            end
            % adds a feasible and infeasible categorical variable column to the ResultsTable
            % Effluent_Quality_Limits introduced
            T=obj.filtertable(T,'TN',10);
            T=obj.filtertable(T,'SNH',1);
            T=obj.filtertable(T,'COD',100);
            T=obj.filtertable(T,'Methane',10);
            T.Status(ismissing(categorical(T.Status))) = 'Feasible';
            T.Status = categorical(T.Status);
            
            if nargout==1, bigT=T; end
                fprintf('\nSummary of Solutions in the ResultsTable object\n\n');
                summary(T.Status); % to find feasible solutions: T(T.Status == 'Feasible',:)

        end



        function bigT = feasible(obj) % T=feasible(R)
            % Returns feasible solutions in a table.
            T = status(obj);
            % histogram(T.Status);  
            T = T(T.Status == 'Feasible',:); 
            % best one= sortrows(T,'OCI')
            if nargout==1; bigT=T; end       
        end

        function bigT = bestCOD(obj)
            % Returns best COD designs
            T = feasible(obj);
            T = sortrows(T,'COD');
            head(T)
            if nargout==1, bigT=T; end
        end



        function bigT = minAerationEnergyDemand(obj,K)
            if nargin<2; K=10; end
            % Returns best COD designs
            T = feasible(obj);
            T = sortrows(T,'AirEnergy');
            try
                T = T(1:K,:);
            catch
                disp(['There are only ' num2str(height(T)) ' feasible solutions.'])
                return
            end
            T = obj.addDesignID(T);
            fprintf('\nWWTP Designs that required minimum aeration energy demand are as follows.\n\n');
            if nargout==0, disp(T); end
            if nargout==1, bigT=T; end
        end

        function bigT = minSludgeProduction(obj,K)
            if nargin<2; K=10; end
            % Returns best COD designs
            T = feasible(obj);
            T = sortrows(T,'Sludge');
            try
                T = T(1:K,:);
            catch
                disp(['There are only ' num2str(height(T)) ' feasible solutions.'])
                return
            end
            T = obj.addDesignID(T);
            fprintf('\nWWTP Designs that produced minimum sludge are as follows.\n\n');
            if nargout==0, disp(T); end
            if nargout==1, bigT=T; end
        end

        function bigT = maxMethaneProduction(obj,K)
            if nargin<2; K=10; end
            % Returns best COD designs
            T = feasible(obj);
            T = sortrows(T,'Methane','descend');
            T = T(1:K,:);
            T = obj.addDesignID(T);
            fprintf('\nWWTP Designs that produced maximum methane gas are as follows.\n\n');
            if nargout==0, disp(T); end
            if nargout==1, bigT=T; end
        end

        function bigT = maxNetEnergy(obj,K)
            if nargin<2; K=10; end
            % Returns best COD designs
            T = feasible(obj);
            T = sortrows(T,'NetEnergy','descend');
            T = obj.addDesignID(T);
            % T = obj.oneFromDesign(T);
            try
                T = T(1:K,:);
            catch
                disp(['There are only ' num2str(height(T)) ' feasible solutions.'])
                return
            end
            % T = obj.deleteStates(T);
            fprintf('\nWWTP Designs that produced maximum energy are as follows.\n\n');
            if nargout==0, disp(T); end
            if nargout==1, bigT=T; end
        end

        function output = bestOfEachLayout(obj)
            T = feasible(obj);
        end

        function display(obj)
            disp(obj.Table);
        end
        function S=YOut(obj,out) % usage: Y = YOut(R,'EQI')
            % get a column vector of the output out
            if nargin<2, out='EQI'; end
            T = feasible(obj);
            i=find(strcmp(T.Properties.VariableNames,out));
            Y=T.(i);

            disp(['The output ' out ' has the following statistics.'])
            % https://se.mathworks.com/matlabcentral/answers/159417-how-to-calculate-the-confidence-interval
            S = struct;
            S.data = Y;
            S.mean = mean(Y);
            S.std  = std(Y);
            S.SEM  = std(Y)/sqrt(length(Y)); % standard error of the mean
            S.ts = tinv([0.025  0.975],length(Y)-1);      % T-Score
            S.CI95 = S.mean + [(S.ts(1)*S.SEM) (S.ts(2)*S.SEM)];
            S.Quantiles_5_95 = quantile(Y, [0.05, 0.95]); % purely based on dataset.
        end

        function output = CI(input)
            % x = randi(50, 1, 100);                      % Create Data
            % SEM = std(x)/sqrt(length(x));               % Standard Error
            % ts = tinv([0.025  0.975],length(x)-1);      % T-Score
            % CI = mean(x) + ts*SEM;                      % Confidence Intervals
            
        end


    end
    
    
    methods (Static)
        function T = dtable()
            % Returns the design table
            T = rs_dtable;
            T = T(:,[1:2]);
        end
        
        function T = addDesignID(T)
            % Adds a designID from SolutionID
            T.DesignID = strings(height(T),1);
            for r=1:height(T)
                T.DesignID(r) = ResultsTable.designID(T.SolutionID{r});
            end
            T = T(:,[1,end,2:end-1]);
        end

        function nT = oneFromDesign(T)
            for r=1:height(T)
                try
                    nT=T(1,:);
                    if T.DesignID(r+1)~=T.DesignID(r) && ~ismember(T.DesignID(r+1), nT.DesignID);
                        nT=[nT;T(r+1,:)];
                    end
                catch
                end
            end
        end

        function T = addVolumes(T)
            T.Vmainline = mainlineV(T.SolutionID);
            T.Vsideline = sidelineV(T.SolutionID);
        end

        function T = deleteStates(T)
            T.COD = [];
            T.TSS = [];
            T.SNO = [];
            T.SNH = [];
            T.TN  = [];
            T.GHGe= [];
        end
        
        function DesignID = designID(SolutionID)
            % Returns string-joined designID
            nID = strsplit(SolutionID,'_');
            nID = str2num(nID{2});
            T = ResultsTable.dtable();
            
            DesignID = string(T{T.nID==nID,'designID'}); 
        end

        function T = filtertable(T,VarName,maxLimit)
            if strcmp(VarName,'Methane')
                rows = T.(VarName) > maxLimit;       
                T.Status(~rows) = [VarName ' Violated'];
            else
                rows = T.(VarName) < maxLimit; % logical vector
                % T.Status(~rows) = repmat('Infeasible',sum(~rows),1);
                % T.Status(~rows) = 'LimitsExceeded';
                T.Status(~rows) = [VarName ' Violated'];
            end
        end

        function T = filterinfeasible(T,VarName,maxLimit)
            T(T.(VarName)<maxLimit,:)=[];
        end

        function T = filterzeromethane(T)
            T(round(T.Methane)<10,:) = [];
        end

        function T = filterminusSNH(T)
            T(T.SNH<0,:) = [];
        end

        function [date,hour] = whenCreated(filename)
            if ispc
                [dum,str] = dos(sprintf('dir %s.mat',filename));
                c = textscan(str,'%s');
                indices = find(contains(c{1},'-'));
                date = c{1}{indices(end)};
                hour = c{1}{indices(end)+1};
            elseif unix
                disp('update the date function for unix system');
                % Read from
                % https://se.mathworks.com/matlabcentral/answers/100248-is-it-possible-to-obtain-the-creation-date-of-a-directory-or-file-in-matlab-7-5-r2007b
            end
        end
    end
end
