% Created by Resul based on Chitta's file init_bsm2Na.m

% 1st of August, 2018

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% asm1initial_for_AS.m
PAR1 = [a_KlaN2O	b_A1	b_A2	b_H	b_KlaN2O	D_N2	D_N2O	D_NO	D_O2	F_BOD_COD	f_P	F_TSS_COD	H_N2	H_N2O	H_NO	H_O2	i_X_B	i_X_P	KlaN2O_anoxic	k_a	K_FA	K_FNA	k_h	K_I10FA	K_I10FNA	K_I3NO	K_I4NO	K_I5NO	K_I9FA	K_I9FNA	K_N2O	K_NO	K_NO2	K_NO3	K_OA1	K_OA2	K_OH	K_OH1	K_OH2	K_OH3	K_OH4	K_OH5	K_S1	K_S2	K_S3	K_S4	K_S5	K_X     mu_A1	mu_A2	mu_H	n_g2	n_g3	n_g4	n_g5	n_h	n_Y	pH	P_N2O_air	P_N2_air	P_NO_air	P_O2_air Y_A1 Y_A2 Y_H X_I2TSS X_S2TSS X_BH2TSS X_BA2TSS X_P2TSS b_Ratkowsky_mu_A1	b_Ratkowsky_mu_A2	b_Ratkowsky_mu_H	c_Ratkowsky_mu_A1	c_Ratkowsky_mu_A2	c_Ratkowsky_mu_H	Temp_Ref	theta_b_A1	theta_b_A2	theta_b_H	theta_kla	theta_k_a	theta_k_h	Tmax_Ratkowsky_mu_A1	Tmax_Ratkowsky_mu_A2	Tmax_Ratkowsky_mu_H	Tmin_Ratkowsky_mu_A1	Tmin_Ratkowsky_mu_A2	Tmin_Ratkowsky_mu_H K_SNH_aob1	K_SNH_aob2	K_SNO2_aob	K_SNO_aob	K_SO_aob1	K_SO_aob2	Y_aob	Y_nob  K_SO_AOBden1  K_IO_AOBden1  K_SO_AOBden2  K_IO_AOBden2  n_AOB  n_Y_AOB  K_FNA_aob K_FA_aob   Y_AnAOB, mu_max_AnAOB, K_NH3_AnAOB, K_HNO2_AnAOB, K_O2_AnAOB, b_AnAOB];
PAR2 = [a_KlaN2O	b_A1	b_A2	b_H	b_KlaN2O	D_N2	D_N2O	D_NO	D_O2	F_BOD_COD	f_P	F_TSS_COD	H_N2	H_N2O	H_NO	H_O2	i_X_B	i_X_P	KlaN2O_anoxic	k_a	K_FA	K_FNA	k_h	K_I10FA	K_I10FNA	K_I3NO	K_I4NO	K_I5NO	K_I9FA	K_I9FNA	K_N2O	K_NO	K_NO2	K_NO3	K_OA1	K_OA2	K_OH	K_OH1	K_OH2	K_OH3	K_OH4	K_OH5	K_S1	K_S2	K_S3	K_S4	K_S5	K_X     mu_A1	mu_A2	mu_H	n_g2	n_g3	n_g4	n_g5	n_h	n_Y	pH	P_N2O_air	P_N2_air	P_NO_air	P_O2_air Y_A1 Y_A2 Y_H X_I2TSS X_S2TSS X_BH2TSS X_BA2TSS X_P2TSS b_Ratkowsky_mu_A1	b_Ratkowsky_mu_A2	b_Ratkowsky_mu_H	c_Ratkowsky_mu_A1	c_Ratkowsky_mu_A2	c_Ratkowsky_mu_H	Temp_Ref	theta_b_A1	theta_b_A2	theta_b_H	theta_kla	theta_k_a	theta_k_h	Tmax_Ratkowsky_mu_A1	Tmax_Ratkowsky_mu_A2	Tmax_Ratkowsky_mu_H	Tmin_Ratkowsky_mu_A1	Tmin_Ratkowsky_mu_A2	Tmin_Ratkowsky_mu_H K_SNH_aob1	K_SNH_aob2	K_SNO2_aob	K_SNO_aob	K_SO_aob1	K_SO_aob2	Y_aob	Y_nob  K_SO_AOBden1  K_IO_AOBden1  K_SO_AOBden2  K_IO_AOBden2  n_AOB  n_Y_AOB  K_FNA_aob K_FA_aob   Y_AnAOB, mu_max_AnAOB, K_NH3_AnAOB, K_HNO2_AnAOB, K_O2_AnAOB, b_AnAOB];
PAR3 = [a_KlaN2O	b_A1	b_A2	b_H	b_KlaN2O	D_N2	D_N2O	D_NO	D_O2	F_BOD_COD	f_P	F_TSS_COD	H_N2	H_N2O	H_NO	H_O2	i_X_B	i_X_P	KlaN2O_anoxic	k_a	K_FA	K_FNA	k_h	K_I10FA	K_I10FNA	K_I3NO	K_I4NO	K_I5NO	K_I9FA	K_I9FNA	K_N2O	K_NO	K_NO2	K_NO3	K_OA1	K_OA2	K_OH	K_OH1	K_OH2	K_OH3	K_OH4	K_OH5	K_S1	K_S2	K_S3	K_S4	K_S5	K_X     mu_A1	mu_A2	mu_H	n_g2	n_g3	n_g4	n_g5	n_h	n_Y	pH	P_N2O_air	P_N2_air	P_NO_air	P_O2_air Y_A1 Y_A2 Y_H X_I2TSS X_S2TSS X_BH2TSS X_BA2TSS X_P2TSS b_Ratkowsky_mu_A1	b_Ratkowsky_mu_A2	b_Ratkowsky_mu_H	c_Ratkowsky_mu_A1	c_Ratkowsky_mu_A2	c_Ratkowsky_mu_H	Temp_Ref	theta_b_A1	theta_b_A2	theta_b_H	theta_kla	theta_k_a	theta_k_h	Tmax_Ratkowsky_mu_A1	Tmax_Ratkowsky_mu_A2	Tmax_Ratkowsky_mu_H	Tmin_Ratkowsky_mu_A1	Tmin_Ratkowsky_mu_A2	Tmin_Ratkowsky_mu_H K_SNH_aob1	K_SNH_aob2	K_SNO2_aob	K_SNO_aob	K_SO_aob1	K_SO_aob2	Y_aob	Y_nob  K_SO_AOBden1  K_IO_AOBden1  K_SO_AOBden2  K_IO_AOBden2  n_AOB  n_Y_AOB  K_FNA_aob K_FA_aob   Y_AnAOB, mu_max_AnAOB, K_NH3_AnAOB, K_HNO2_AnAOB, K_O2_AnAOB, b_AnAOB];
PAR4 = [a_KlaN2O	b_A1	b_A2	b_H	b_KlaN2O	D_N2	D_N2O	D_NO	D_O2	F_BOD_COD	f_P	F_TSS_COD	H_N2	H_N2O	H_NO	H_O2	i_X_B	i_X_P	KlaN2O_anoxic	k_a	K_FA	K_FNA	k_h	K_I10FA	K_I10FNA	K_I3NO	K_I4NO	K_I5NO	K_I9FA	K_I9FNA	K_N2O	K_NO	K_NO2	K_NO3	K_OA1	K_OA2	K_OH	K_OH1	K_OH2	K_OH3	K_OH4	K_OH5	K_S1	K_S2	K_S3	K_S4	K_S5	K_X     mu_A1	mu_A2	mu_H	n_g2	n_g3	n_g4	n_g5	n_h	n_Y	pH	P_N2O_air	P_N2_air	P_NO_air	P_O2_air Y_A1 Y_A2 Y_H X_I2TSS X_S2TSS X_BH2TSS X_BA2TSS X_P2TSS b_Ratkowsky_mu_A1	b_Ratkowsky_mu_A2	b_Ratkowsky_mu_H	c_Ratkowsky_mu_A1	c_Ratkowsky_mu_A2	c_Ratkowsky_mu_H	Temp_Ref	theta_b_A1	theta_b_A2	theta_b_H	theta_kla	theta_k_a	theta_k_h	Tmax_Ratkowsky_mu_A1	Tmax_Ratkowsky_mu_A2	Tmax_Ratkowsky_mu_H	Tmin_Ratkowsky_mu_A1	Tmin_Ratkowsky_mu_A2	Tmin_Ratkowsky_mu_H K_SNH_aob1	K_SNH_aob2	K_SNO2_aob	K_SNO_aob	K_SO_aob1	K_SO_aob2	Y_aob	Y_nob  K_SO_AOBden1  K_IO_AOBden1  K_SO_AOBden2  K_IO_AOBden2  n_AOB  n_Y_AOB  K_FNA_aob K_FA_aob   Y_AnAOB, mu_max_AnAOB, K_NH3_AnAOB, K_HNO2_AnAOB, K_O2_AnAOB, b_AnAOB];
PAR5 = [a_KlaN2O	b_A1	b_A2	b_H	b_KlaN2O	D_N2	D_N2O	D_NO	D_O2	F_BOD_COD	f_P	F_TSS_COD	H_N2	H_N2O	H_NO	H_O2	i_X_B	i_X_P	KlaN2O_anoxic	k_a	K_FA	K_FNA	k_h	K_I10FA	K_I10FNA	K_I3NO	K_I4NO	K_I5NO	K_I9FA	K_I9FNA	K_N2O	K_NO	K_NO2	K_NO3	K_OA1	K_OA2	K_OH	K_OH1	K_OH2	K_OH3	K_OH4	K_OH5	K_S1	K_S2	K_S3	K_S4	K_S5	K_X     mu_A1	mu_A2	mu_H	n_g2	n_g3	n_g4	n_g5	n_h	n_Y	pH	P_N2O_air	P_N2_air	P_NO_air	P_O2_air Y_A1 Y_A2 Y_H X_I2TSS X_S2TSS X_BH2TSS X_BA2TSS X_P2TSS b_Ratkowsky_mu_A1	b_Ratkowsky_mu_A2	b_Ratkowsky_mu_H	c_Ratkowsky_mu_A1	c_Ratkowsky_mu_A2	c_Ratkowsky_mu_H	Temp_Ref	theta_b_A1	theta_b_A2	theta_b_H	theta_kla	theta_k_a	theta_k_h	Tmax_Ratkowsky_mu_A1	Tmax_Ratkowsky_mu_A2	Tmax_Ratkowsky_mu_H	Tmin_Ratkowsky_mu_A1	Tmin_Ratkowsky_mu_A2	Tmin_Ratkowsky_mu_H K_SNH_aob1	K_SNH_aob2	K_SNO2_aob	K_SNO_aob	K_SO_aob1	K_SO_aob2	Y_aob	Y_nob  K_SO_AOBden1  K_IO_AOBden1  K_SO_AOBden2  K_IO_AOBden2  n_AOB  n_Y_AOB  K_FNA_aob K_FA_aob   Y_AnAOB, mu_max_AnAOB, K_NH3_AnAOB, K_HNO2_AnAOB, K_O2_AnAOB, b_AnAOB];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% settler1dinit_bsm2_for_onepathway.m
if ismember('MLE',designID)
SETTLERPAR = [ v0_max v0 r_h r_p f_ns X_t sb_limit ];
DIM = [ area_sc height_sc ];
LAYER = [ feedlayer nooflayers ];
else
    DIM=0;
end
    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% primclarinit_bsm2.m
PAR_P = [ f_corr  f_X  t_m  f_PS ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RBF 
%PAR_RBF_wop = [tss_eff_rbf_wop f_ps_rbf_wop]; % RBF without polymer
%PAR_RBF_wp = [tss_eff_rbf_wp f_ps_rbf_wp]; % RBF with polymer


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% thickenerinit_bsm2.m
THICKENERPAR = [ thickener_perc TSS_removal_perc X_I2TSS X_S2TSS X_BH2TSS X_BA2TSS X_P2TSS ];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% dewateringinit_bsm2.m
DEWATERINGPAR = [ dewatering_perc TSS_removal_perc X_I2TSS X_S2TSS X_BH2TSS X_BA2TSS X_P2TSS ];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% adm1init_bsm2.m
% used by all three ADM implementations, adm1_ODE, adm1_DAE1 and adm1_DAE2.
DIGESTERINIT = [ S_su S_aa S_fa S_va S_bu S_pro S_ac S_h2 S_ch4 S_IC S_IN S_I X_xc X_ch X_pr X_li X_su X_aa X_fa X_c4 X_pro X_ac X_h2 ... 
                 X_I S_cat S_an S_hva S_hbu S_hpro S_hac S_hco3 S_nh3 S_gas_h2 S_gas_ch4 S_gas_co2 Q_D T_D S_D1_D S_D2_D S_D3_D X_D4_D X_D5_D ];

% used by both DAE ADM implementations, adm1_DAE1 and adm1_DAE2.
PHSOLVINIT = [ S_H_ion S_hva S_hbu S_hpro S_hac S_hco3 S_nh3 ];

% used by one DAE ADM implementation, adm1_DAE2.
SH2SOLVINIT = [ S_h2 ];

DIGESTERPAR = [ f_sI_xc f_xI_xc f_ch_xc f_pr_xc f_li_xc N_xc N_I N_aa C_xc C_sI C_ch C_pr C_li C_xI C_su C_aa f_fa_li C_fa ...
f_h2_su f_bu_su f_pro_su f_ac_su N_bac C_bu C_pro C_ac C_bac Y_su f_h2_aa f_va_aa f_bu_aa f_pro_aa f_ac_aa C_va Y_aa Y_fa ...
Y_c4 Y_pro C_ch4 Y_ac Y_h2 k_dis k_hyd_ch k_hyd_pr k_hyd_li K_S_IN k_m_su K_S_su pH_UL_aa pH_LL_aa k_m_aa K_S_aa k_m_fa ...
K_S_fa K_Ih2_fa k_m_c4 K_S_c4 K_Ih2_c4 k_m_pro K_S_pro K_Ih2_pro k_m_ac K_S_ac K_I_nh3 pH_UL_ac pH_LL_ac k_m_h2 K_S_h2 ...
pH_UL_h2 pH_LL_h2 k_dec_Xsu k_dec_Xaa k_dec_Xfa k_dec_Xc4 k_dec_Xpro k_dec_Xac k_dec_Xh2 R T_base T_op pK_w_base pK_a_va_base pK_a_bu_base ...
pK_a_pro_base pK_a_ac_base pK_a_co2_base pK_a_IN_base k_A_Bva k_A_Bbu k_A_Bpro k_A_Bac k_A_Bco2 k_A_BIN P_atm kLa ...
K_H_h2o_base K_H_co2_base K_H_ch4_base K_H_h2_base k_P ];

DIM_D = [ V_liq V_gas ];

INTERFACEPAR = [ CODequiv fnaa fnxc fnbac fxni fsni fsni_adm frlixs frlibac frxs_adm fdegrade_adm frxs_as fdegrade_as ...
R T_base T_op pK_w_base pK_a_va_base pK_a_bu_base pK_a_pro_base pK_a_ac_base pK_a_co2_base pK_a_IN_base  CODequiv_NO3  CODequiv_NO2  CODequiv_NO  CODequiv_N2O iN_B  f_P  Y_H  iN_XP n_Y];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% IFAS
if ismember('IFAS',designID)
REACTOR_IFAS   = [ V_IFAS density_IFAS z_max_IFAS pH_set_IFAS S_O2_sat_IFAS, fill_frac_ifas]; %
KIN_IFAS = [mu_max_AOB,K_O2_AOB,K_NH3_AOB,b_AOB,Y_AOB,mu_max_NOB,K_O2_NOB,K_HNO2_NOB,b_NOB,Y_NOB,mu_max_AnAOB,K_O2_AnAOB,K_NH3_AnAOB,K_HNO2_AnAOB,b_AnAOB,Y_AnAOB,f_i,i_NXB,i_NXI,k_H,K_X,mu_max_HB,K_O2_HB,K_NH4_HB,K_NO2_HB,K_NO3_HB,K_S_HB,nu_HB,b_HB,Y_HB,K_HNO2_AOB];
SETTLERPAR = [ v0_max v0 r_h r_p f_ns X_t sb_limit ];
DIM_ifas = [ area_sc_ifas height_sc_ifas ];
LAYER = [ feedlayer nooflayers ];
else
    REACTOR_IFAS=0;
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ELANM

%% Mainstream_Elan_parameters.m
if ismember('ELANM',designID)
REACTOR_ELANM = [ V_ELANM VSS_op_ELANM density_ELANM z_max_ELANM pH_set_ELANM S_O2_sat_ELANM];
else
    REACTOR_ELANM=0;
    
end

if ismember('ELANS',designID)
REACTOR_ELANS = [ V_ELANS VSS_op_ELANS density_ELANS z_max_ELANS pH_set_ELANS S_O2_sat_ELANS];
else
REACTOR_ELANS=0;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Astage
PAR_astage=[mu_max_H,K_S_het,K_O2_het,K_nh4_het,eta_no2,K_no2_het,eta_no3,K_no3_het,q_xs_hyd,K_x,eta_nox,Y_H_astage,Y_H_no2,f_P,Y_H_no3,i_X_B,i_n_ss,i_X_P,b_H];

if ismember('HRAS',designID)
SETTLERPAR = [ v0_max v0 r_h r_p f_ns X_t sb_limit ];
DIM_astage = [ area_sc_astage height_sc_astage ];
LAYER = [ feedlayer nooflayers ];
else
    DIM_astage=0;
end
 
                         
                         
               
                                            
                                             
                                              
                                                
                                                     
                                        
                            
                                                      
