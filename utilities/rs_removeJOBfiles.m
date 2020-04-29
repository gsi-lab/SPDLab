function rs_removeJOBfiles(jobs2remove)
    if nargin<1
        delete *.sh
        delete rs_mjob*.m
        delete opart*
        delete epart*
    end
end