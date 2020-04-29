function dSpace = rs_designSpace(dID)
    % Creates a design space object of InputSpace class from a given designID
    common = {'TH','DW'};
    uMap   = rs_unitMap(); % load units.
    dSpace = InputSpace;
    dID    = [dID common];
    for i=1:length(dID) % for KEY in dID
        KEY = dID{i};
        dSpace = merge(dSpace, uMap(KEY).DesignSpace);
    end
end 

