function [T, designIDs] = rs_ctable()
    % Returns a table of configurations
    primary_units   = {'PC','RBF','ERBF'};
    secondary_units = {'MLE','IFAS'};
    sludge_units    = {'ADM'};
    side_units      = {'BP_side'}; 

    designIDs = {};
    for p=1:length(primary_units)
        for m=1:length(secondary_units)
            for s=1:length(sludge_units)
                for r=1:length(side_units)
                    did ={primary_units{p}, secondary_units{m}, sludge_units{s}, side_units{r}};
                    designIDs{end+1,1} = did; % to get all dids, designIDs{:}
                end
            end
        end
    end
    
    didc = {};
    for d=1:length(designIDs), did=designIDs{d}; didc{d,1}=strjoin(did,'-'); end
    T = table; 
    T.cID=[1:length(didc)]'; 
    T.designID = didc; 
end