function KPI = rs_run(I6,G,rowXd,rowXi,designID,kspace,c)
    % Simulates a single set of design decisions for a single realization of 
    % influent uncertainty and returns plant KPIs.
    
    influent=c.influent;
    [~,AVEDORE] = rs_print_influent('avedore');
    
    struct2vars(I6);
    struct2vars(G);
    rs_init_bsm2Na_pars % pass all that is needed.
    
    % Update the design variables that will be executed in vecs.
    designrow = table2struct(array2table(rowXd, 'VariableNames', kspace.ParNames));
    space    = rs_designSpace(designID); sspace = substract(space,kspace); % unimportant space
    for up=1:numel(sspace.ParNames)
        designrow.(sspace.ParNames{up})=mean([sspace.LowerBounds(up) sspace.UpperBounds(up)]); 
    end
    struct2vars(designrow);
   
    % Update the influent file in the workspace (CONSTINFLUENT_BSM2)
    [pars,mu,unc] = rs_getSet(c); ispace = InputSpace(pars,mu,unc);
    [INFLUENT,CONSTINFLUENT_BSM2,AVEDORE] = rs_newINFLUENT(rowXi,ispace,influent);
    
    T_sim = 1000;
    
    % Simulate
    rs_init_bsm2Na_vecs
    sys=c.sys;  %Open the simulink file    load_system(sys);
    load_system(sys);
    rs_select_influent; % needs influent
    myOptions = simset('SrcWorkspace','current','DstWorkspace','current');
    sim(sys,[], myOptions) %Simulate the simulink file

    try
        cr_bsm2N_plant_perf
    catch
        disp('Performandce file didnt work.')
    end
end