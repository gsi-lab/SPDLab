function T = rs_MCstats(M)
    % Returns the summary of MCS results including MC error.
    varnames = {'OCI','COD','SNH','TN'};
    R = [nanmean(M); nanstd(M); nanvar(M); nanstd(M)./sqrt(size(M,1)); nanstd(M)./nanmean(M)];
    T = array2table(R,'VariableNames',varnames,...
             'RowNames',{'Mean','Std','Var','MCerr','CoV'})
end

