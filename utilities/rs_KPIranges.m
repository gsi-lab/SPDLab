function [r,M] = rs_KPIranges(T)
    % Returns ranges r and matrices of KPIs.
    cc = cellfun(@(c) strsplit(c,'_'), T.Properties.RowNames, 'UniformOutput', false); 
    cc = cellfun(@(c) c{1}, cc, 'UniformOutput', false); k=numel(unique(cc)); m=length(cc)/k;
    
    for  i=1:k
        for j=1:k
            runID = sprintf('d%d_i%d',i,j);
            KPI = T{runID,'KPI'}; if iscell(KPI), KPI=KPI{:}; end
            try, OCI(i,j) = KPI.OCI; catch, OCI(i,j)=NaN; end
            try, SNH(i,j) = KPI.SNH; catch, SNH(i,j)=NaN; end
            try, COD(i,j) = KPI.COD; catch, COD(i,j)=NaN; end
            try,  TN(i,j) = KPI.TN;  catch,  TN(i,j)=NaN; end
            try, EQI(i,j) = KPI.TN;  catch, EQI(i,j)=NaN; end
            try, CH4(i,j) = KPI.Methane;  catch, CH4(i,j)=NaN; end
        end
    end
    r.OCI = range(OCI(:));
    r.EQI = range(EQI(:));
    r.CH4 = range(CH4(:));
    r.COD = range(COD(:));
    r.SNH = range(SNH(:));
    r.TN  = range(TN(:));
    M.COD=COD; M.SNH=SNH; M.TN=TN; M.OCI=OCI; M.EQI=EQI; M.CH4=CH4;
    if k>1, save('initials/inKPIranges','r','M'); end
end