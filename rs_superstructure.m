function SS = rs_superstructure()
    % Creates a superstructure from models
    
    % Put all the alternative, callable model names in differents process steps.
    SS = struct;
    SS.primary_units   = {'PC','RBF','ERBF','HRAS'};
    SS.secondary_units = {'MLE','IFAS','ELANM'};
    SS.sludge_units    = {'ADM'};
    SS.side_units      = {'BP_side','ELANS'}; 
end

