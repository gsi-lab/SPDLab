function [I6,G] = rs_initialize(rowXd,c)
    % Initializes a given set of design and operational variables to find
    % initial conditions by applying the sequential simulation methodology
    influent = 'BSM2'; % influent for the initialization.
    [INFLUENT,CONSTINFLUENT_BSM2,AVEDORE] = rs_get_influent(influent);
        
    % get the key design space and the designID
    load(c.GSAdata,'kspace');    % GSA data of the configuration
    load(c.MCSdata,'designID');  % MCS data of the configuration
    
    
    % update the design variables that will be executed in vecs.
    designrow = table2struct(array2table(rowXd, 'VariableNames', kspace.ParNames));
    space    = rs_designSpace(designID); sspace = substract(space,kspace); % unimportant space
    for up=1:numel(sspace.ParNames), designrow.(sspace.ParNames{up})=mean([sspace.LowerBounds(up) sspace.UpperBounds(up)]); end
    struct2vars(designrow);
    
    T_sim    = 2000;

    % Run step1
    step1_pc
    I1 = rs_extractInit1(designrow,primaryin,primaryout,PC_load1,PC_load2);

    % Run step2
    step2_pc_mle_th
    I2 = rs_extractInit2(settler_mle,XINITDELAY_mle,reac1,reac2,reac3,reac4,reac5,TH_load1,TH_load2);

    % Run step3 intermediate
    step3_pc_mle_th_AD_initial
    I3 = rs_extractInit3(DIGESTERINIT);

    % Run step3
    step3_pc_mle_th_AD_DE
    I4 = rs_extractInit4(digesterout,DE_load1,DE_load2);

    % Run step4
    step4_pc_mle_th_AD_DE_rec1
    I5 = rs_extractInit5(primaryout,primaryin,settler_mle,digesterout,digesterinpreinterface,reac1,reac2,reac3,reac4,reac5,TH_load1,XINITDELAY_mle);

    % Run step5
    step5_pc_mle_th_AD_DE_rec1_rec2
    I6 = rs_extractInit6(primaryout,primaryin,ASinput1,reac1,reac2,reac3,reac4,reac5,settler_mle,digesterout,rec);
    G  = rs_extractGeom(VOL_P,VOL1,VOL2,VOL3,VOL4,VOL5,V_liq,V_gas,area_sc,height_sc,Qintr,Qr,Qw); % Store geometry
    bdclose('all');
end