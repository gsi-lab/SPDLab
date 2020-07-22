function [OCI,COD,SNH,TN] = rs_extractD(D)
    % Extract the results from parallel Monte Carlo simulations. 
    % By Resul Al @DTU
    
    COD = NaN(size(D))'; 
    TN  = NaN(size(D))'; 
    SNH = NaN(size(D))'; 
    OCI = NaN(size(D))'; 
    
    for d=1:numel(D)
        try, COD(d) = D(d).KPI.COD;  catch, end
        try, TN(d)  = D(d).KPI.TN ;  catch, end
        try, SNH(d) = D(d).KPI.SNH;  catch, end
        try, OCI(d) = D(d).KPI.OCI;  catch, end
    end
    
    fprintf('Checking data ...\n%.2f percent of simulations did not run successfully.\n', 100*errorrate(D))
    if isempty(OCI), OCI=OBJ; end
end

function rate = errorrate(D)
    e=0;
    for d=1:numel(D)
        if ~isempty(D(d).S)
            e=e+1;
        end
    end
    rate=e/numel(D);
end