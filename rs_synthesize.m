function [T, designIDs] = rs_synthesize(SS)
    % Returns a table of configurations contained in a superstructure

    designIDs = {};
    for p=1:length(SS.primary_units)
        for m=1:length(SS.secondary_units)
            for s=1:length(SS.sludge_units)
                for r=1:length(SS.side_units)
                    did ={SS.primary_units{p}, SS.secondary_units{m}, ...
                        SS.sludge_units{s}, SS.side_units{r}};
                    designIDs{end+1,1} = did; % to get all dids, designIDs{:}
                end
            end
        end
    end
    
    didc = {};
    for d=1:length(designIDs), did=designIDs{d}; didc{d,1}=strjoin(did,'_'); end
    T = table; 
    T.cID=[1:length(didc)]'; 
    T.designID = didc; 
end
