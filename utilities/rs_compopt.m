function rs_compopt(results)
    % compares/prints the optimum found from SKopt against the bounds.
    Ranges=[results.VariableDescriptions.Range];
    T=table;
    T.LBounds = Ranges(1:2:end)';
    T.OptFound = table2array(results.XAtMinObjective)';
    T.UBounds = Ranges(2:2:end)';
    try
        rs_addpaths
        load('PCEanalysis.mat','kspace')
        T.Properties.RowNames=kspace.ParNames;
    catch
        T.Properties.RowNames={results.VariableDescriptions.Name};
    end
    T.Hits=string(repmat("none",height(T),1));
    T.Hits(T.OptFound==T.LBounds) = "LB";
    T.Hits(T.OptFound==T.UBounds) = "UB";
    T.Hits=categorical(T.Hits);
    fprintf('\n');
    disp(T);    
end