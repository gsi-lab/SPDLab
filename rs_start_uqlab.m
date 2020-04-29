function rs_start_uqlab()
    if strcmpi(computer,'GLNXA64')
        cdh = pwd; cd('/zhome/d0/1/124116/rs_Folder/my_UQLab_Folder/core'); uqlab; cd(cdh);
    else
        uqlab; 
    end            
end     
