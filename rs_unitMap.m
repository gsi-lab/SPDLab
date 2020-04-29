function uMap = rs_unitMap(varargin)
    % Storing Unit data in UnitClass and InputSpace objects 
    % By Resul 15/03/2020
    
    % Primary Clarifier
    PC                     = UnitClass();
    PC.KEY                 = 'PC';
    PC.FullName            = 'Primary Clarifier';
    PC.DesignSpace         = InputSpace({'SOR_pc','height_pc'},[30 3.0],[50 4.9]);
    PC.UncertainSpace      = InputSpace({'f_PS'},[0.001],[0.020]);

    % Rotating Belt Filter without polymer
    RBF                = UnitClass();
    RBF.KEY            = 'RBF';
    RBF.FullName       = 'Rotating Belt Filter without polymer';
    RBF.DesignSpace    = InputSpace();
    RBF.UncertainSpace = InputSpace({'f_PS'},[0.001],[0.020]);


    % Rotating Belt Filter with polymer
    ERBF                 = UnitClass();
    ERBF.KEY             = 'ERBF';
    ERBF.FullName        = 'Rotating Belt Filter with polymer';
    ERBF.DesignSpace     = InputSpace();
    ERBF.UncertainSpace  = InputSpace({'f_PS'},[0.001],[0.020]);
    
    %High rate activated sludge
    HRAS                 = UnitClass();
    HRAS.KEY             = 'HRAS';
    HRAS.FullName        = 'High rate activated sludge';
    HRAS.DesignSpace     = InputSpace({'HRT_astage','SRT_astage','RR_astage','SOR_sc_astage','height_sc_astage'},[0.0104 0.1 0.25 16 4.0],[0.0417 1 1.0 33 5.5]);
    HRAS.UncertainSpace  = InputSpace();
              
    

    % MLE = Activated Sludge Unit + Secondary Clarifier
    MLE                    = UnitClass();
    MLE.KEY                = 'MLE';
    MLE.FullName           = 'Activated Sludge Unit + Secondary Clarifier';
    MLE.DesignSpace        = InputSpace({'HRT_ae', 'SRT_as', 'RR_e', 'RR_i', 'VR_as','SOR_sc','height_sc','carb1','SO2ref_mle'},[0.125 5  0.25 1 0.2 16 4.0 0 0.7],[0.500 15 1.00 3 0.8 33 5.5 10 1.5]);
    MLE.UncertainSpace     = InputSpace(); 
    % [parnames,lbounds,ubounds] = rs_getSet('asm1');                                      
    % MLE.UncertainSpace    = InputSpace(parnames,lbounds,ubounds); 

 
    % Anaerobic Digestor
    ADM                    = UnitClass();
    ADM.KEY                = 'ADM';
    ADM.FullName           = 'Anaerobic Digestor';
    ADM.DesignSpace        = InputSpace({'SRT_ad'},[15],[20]);
    ADM.UncertainSpace     = InputSpace(); 
    %[parnames,lbounds,ubounds] = rs_getSet('adm1'); % Kimberly set                                     
    

    % ELAN side stream
    ELANS                  = UnitClass();
    ELANS.KEY              = 'ELANS';
    ELANS.FullName         = 'ELAN side stream';
    ELANS.DesignSpace      = InputSpace({'NLR_elans','SRT_elans','VSS_op_ELANS','RR_elans'},[0.4,20,1000,1],[0.9,80,12000,1.5]); 
    ELANS.UncertainSpace   = InputSpace();

    % ELAN main stream
    ELANM                  = UnitClass();
    ELANM.KEY              = 'ELANM';
    ELANM.FullName         = 'ELAN main stream';
    ELANM.DesignSpace      = InputSpace({'NLR_elanm','SRT_elanm','VSS_op_ELANM','RR_elanm'},[0.05,20,1000,1],[0.5,80,12000,1.5]); 
    ELANM.UncertainSpace   = InputSpace();

    % IFAS main stream
    IFAS                   = UnitClass();
    IFAS.KEY               = 'IFAS';
    IFAS.FullName          = 'IFAS main stream';
    IFAS.DesignSpace       = InputSpace({'NLR_ifas','MLSS_ifas','fill_frac_ifas','RR_ifas','SOR_sc_ifas','height_sc_ifas','SO2ref_ifas'},[0.05,1000,0.30,1,16,4.0,0.10],[0.5,5000,0.60,3,33 5.5,0.5]); 
    IFAS.UncertainSpace    = InputSpace();
    

    % Thickener
    TH                     = UnitClass();
    TH.KEY                 = 'TH';
    TH.FullName            = 'Thickener';
    TH.DesignSpace         = InputSpace(); 
    TH.UncertainSpace      = InputSpace({'thickener_perc','TSS_removal_perc_th'},[5 85],[10 99]);

    % Dewatering
    DW                     = UnitClass();
    DW.KEY                 = 'DW';
    DW.FullName            = 'Dewatering';
    DW.DesignSpace         = InputSpace(); 
    DW.UncertainSpace      = InputSpace({'dewatering_perc','TSS_removal_perc_dw'},[25 85],[35 99]);
    
    % BP
    BP_prim                = UnitClass();
    BP_main                = UnitClass();
    BP_adm                 = UnitClass();
    BP_side                = UnitClass();

    % Map of all units
    % uKeys   = {'PC','RBF','ERBF','MLE','ADM','ELANS','ELANM','IFAS','TH','DW','BP_prim','BP_main','BP_adm','BP_side'};
    % uValues = {PC RBF_wop RBF_wp MLE ADM ELANS ELANM IFAS TH DW BP_prim BP_main BP_adm BP_side};
    % uMap    = containers.Map(uKeys,uValues);

    uKeys={};
    uValues={};
    w = whos; % Looks for all variables
    for i=1:length(w)
        if strcmp(w(i).class,'UnitClass')
            uKeys{end+1}=w(i).name;
            eval(sprintf('uValues{end+1}= %s;',w(i).name));
        end
    end
    uMap    = containers.Map(uKeys,uValues);
end

