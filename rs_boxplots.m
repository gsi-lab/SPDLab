function bT=rs_boxplots(argIn,output,varargin)
    % Boxplots given designs for the output of interest.
    % Resul Al
    
    if nargin<2, output='OCI'; end
    if nargin<1, argIn=1:100; end
    if isnumeric(argIn),  argIn = strseq('design',argIn); end
    
    bigS = rs_getS;

    bigT = table;
    for i = 1:length(argIn)
        designi = argIn{i};
        try
            % T(logical(round(T.Methane)),:)
            T = bigS.(designi);
            R = ResultsTable(T);
            T = R.filterzeromethane(T);
            T = R.filterminusSNH(T);
            T = R.filterinfeasible(T,'SNH',5);
            % T = T(T.TN<10,:);
            % T = T(T.SNH<1,:);
            % T = T(T.COD<100,:);
            A = T.(output);
            % A = bigS.(designi).(output);
            A(A==0) = NaN; % treat the zerolines
            % A(round(A)==0,:) = NaN; % treat the zerolines
            % T = addSolutionID(R,sscanf(designi,'design%d'));
        catch
            % disp([designi ' is missing. It is skipped!.'])
            continue
        end
        
        T = table;
        T.Output = A;
        T.BoxplotLabel = string(repmat(['Design ' erase(designi,'design')],length(A),1));
        bigT = [bigT; T];          
    end 

    if length(argIn)>10
        % bigT.BoxplotLabel = erase(bigT.BoxplotLabel,'design');
        ang=45;
    else
        ang=0;
    end
    if nargout==1; bT=bigT; end

    boxplot(bigT.Output,bigT.BoxplotLabel, 'Whisker',1.5, varargin{:}) % 'PlotStyle','compact',
    xlabel('Designs')
    ylabel(output)
    xtickangle(ang);
    line([0,100],[0,0],'LineWidth',2,'Color','red')
    % ax1=gca;
    % ax2 = axes('Position',ax1.Position,...
    % 'XAxisLocation','top')
end