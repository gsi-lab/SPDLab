function kspace = rs_kspace(cID,threshold)
    % returns the key design space parameters by an ensemble method of surrogate
    % based GSA results
    if nargin<2, threshold=0.10; end
    gsapath = fullfile('..','GSA',sprintf('c%d_GSAresults',cID));
    load(gsapath,'sT','kspace');
    sT.ensSTi = mean([sT.pceSTi sT.gprSTi sT.annSTi],2);

    % identify key parameters for a KPI with a threshold (5%).
    kT = sT(sT.ensSTi>threshold, :);

    kpars = kT.Row(:)';
    klbs  = kspace.LowerBounds(ismember(kspace.ParNames,kpars));
    kubs  = kspace.UpperBounds(ismember(kspace.ParNames,kpars));
    kspace = InputSpace(kpars,klbs,kubs);
end