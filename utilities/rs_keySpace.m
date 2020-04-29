function [important_space, myPCE, pceSi, pceSTi] = rs_keySpace(X,Y,space,outs, threshold)
    % Returns the key important parameters of a space for an output Y given
    % X by performing a PCE-based GSA.
    
    if nargin<5, threshold=0.10; end
    rng default
    
    % treat NaNs
    T=table; T.X=X;T.Y=Y; nobs=height(T); Tn=rmmissing(T); nnobs=height(Tn); X=Tn.X; Y=Tn.Y;
    if nnobs<nobs, fprintf('\n%d rows are removed from the datasets due to the missing values.\n\n',nobs-nnobs); end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % INPUT DEFINITON
    rs_start_uqlab
    for ii=1:size(X,2) % number of pars
        IOpts.Marginals(ii).Type = 'Uniform' ;
        IOpts.Marginals(ii).Parameters = [space.LowerBounds(ii) space.UpperBounds(ii)]; 
    end
    myInput = uq_createInput(IOpts);


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % MODEL CREATION
    MetaOpts.Type = 'Metamodel';
    MetaOpts.MetaType = 'PCE'; 
    MetaOpts.ExpDesign.Sampling = 'user';
    MetaOpts.ExpDesign.X = X;
    MetaOpts.ExpDesign.Y = Y;
    MetaOpts.Method = 'LARS'; 
    MetaOpts.Degree = 2:15;

    % the model
    myPCE     = uq_createModel(MetaOpts);

    % peredictions from the model
    Y_PCE=uq_evalModel(myPCE, X);

    % R2
    R2 = corr(Y,Y_PCE).^2 


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Getting the PCE-based indices.
    SobolOpts.Type = 'Sensitivity';
    SobolOpts.Method = 'Sobol';
    SobolOpts.Sobol.Order = 1; 

    PCESobolAnalysis = uq_createAnalysis(SobolOpts);
    PCESobolResults  = PCESobolAnalysis.Results;
    pceSi   = PCESobolResults.FirstOrder;
    pceSTi  = PCESobolResults.Total;


    % get input and output names
    pars = space.ParNames;
    if nargin<4, outs = strseq('y',1:size(Y,2))'; out=outs{1}; end

    pceSi = array2table(pceSTi,'RowNames', pars, 'VariableNames', outs);
    pceSTi = array2table(pceSTi,'RowNames', pars, 'VariableNames', outs)

    % identify key parameters for a KPI with a threshold (5%).
    key_pars = pceSTi(pceSTi.(out)>threshold, out)
    bar(categorical(key_pars.Row),key_pars.(out)')

    kpars = key_pars.Row(:)';
    klbs  = space.LowerBounds(ismember(space.ParNames,kpars));
    kubs  = space.UpperBounds(ismember(space.ParNames,kpars));
    important_space = InputSpace(kpars,klbs,kubs);
end