% Class for the objects to define design spaces.
% By Resul Al @DTU
classdef InputSpace  
    properties
        ParNames
        LowerBounds
        UpperBounds
        %         Distributions
    end
    methods
        function obj = InputSpace(varargin) % Constructor
            if nargin==1 % a structure entered.
                obj.ParNames = varargin{1}.ParNames;
                obj.LowerBounds = varargin{1}.LowerBounds;
                obj.UpperBounds = varargin{1}.UpperBounds;
            elseif nargin==3 % data entered.
                obj.ParNames    = varargin{1};
                obj.LowerBounds = varargin{2};
                obj.UpperBounds = varargin{3};
            end       
        end
        function X = sample_space(obj,N,sampling)
            if nargin<3, sampling='LHS'; end
            d = numel(obj.ParNames);
            Xp=lhsdesign(N,d); % sampling in unit probability space
            % convert probability space to real value space via inverse distribution
            L=repmat(obj.LowerBounds,N,1);
            U=repmat(obj.UpperBounds,N,1);
            X = unifinv(Xp,L,U); 
        end
        % merge variable number of spaces
        function obj = merge(varargin)
            a              = horzcat(varargin{:}); % array of objects
            [ParNames,ind] = unique([a.ParNames]);
            LowerBounds    = [a.LowerBounds];            
            UpperBounds    = [a.UpperBounds]; 
            obj = InputSpace(ParNames,LowerBounds(ind),UpperBounds(ind));           
        end
        % substract space2 from space1
        function obj = substract(space1,space2) %
            [pars,ind] = setdiff(space1.ParNames,space2.ParNames);
            obj = InputSpace(pars,space1.LowerBounds(ind),space1.UpperBounds(ind));           
        end
        function obj = remove(obj,pars) % remove a specified parameter from a space.
            if isstring(pars)|ischar(pars), pars=cellstr(pars), end
            props = properties(obj);
            for p=1:length(pars)
                ind=find(contains(obj.ParNames,pars{p}));
                for pr=1:length(props)
                    prop=props{pr};
                    obj.(prop)(ind)=[];
                end
            end
        end   
        function bounds(obj,pars) % prints lbs and ubs of given pars
            if isstring(pars)|ischar(pars), pars=cellstr(pars), end
            for p=1:length(pars)
                ind=find(contains(obj.ParNames,pars{p}));
                disp(['Lower bound for ', obj.ParNames{ind}, ' is ', num2str(obj.LowerBounds(ind))]);
                disp(['Upper bound for ', obj.ParNames{ind}, ' is ', num2str(obj.UpperBounds(ind))]);
            end
        end
        function show(obj)
            fprintf(['Your InputSpace object named ',inputname(1),' has the following variables/parameters with corresponding bounds.\n\n'])
            T = table(obj.ParNames',obj.LowerBounds',obj.UpperBounds',...
                      'VariableNames',{'ParNames','LowerBounds','UpperBounds'});
            disp(T)            
        end
    end
end
