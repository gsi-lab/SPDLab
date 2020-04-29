% This file contains kinetic parameters values for all the process


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MLE

Qintrtype = 1;

a_KlaN2O	=       0; % rewritten in reginit with bsm_ss_2 ?
b_A1	    =       0.028; % d-1
b_A2 =          	0.028; % d-1
b_H =           	0.3; % d-1
b_KlaN2O	=       0; % ?
D_N2	=           1.86E-9; % ?
D_N2O	=           1.77E-9;% ?
D_NO	=           8.7E-11;% ?
D_O2	=           2.12E-9;% ?
F_BOD_COD	=       0.65;% ?
f_P  =              0.08; % ASMN default
F_TSS_COD	=       0.75; % decided
H_N2	=           1.64; % ?
H_N2O	=           0.04;% ?
H_NO	=           0.53;% ?
H_O2	=           0.77;% ?
i_X_B	=           0.086; % ASMN
i_X_P	=           0.06; % ASMN
KlaN2O_anoxic	=   2;   % ?

k_a               = 0.07;     % GUO
K_FA               =0.004;     % GUO
K_FNA              =1E-6;       %  GUO
k_h  =              2.89;      %  GUO

K_I10FA	 =          0.5;  %  GUO
K_I10FNA	=       0.1;  %  GUO
K_I3NO	=           0.5;  % DEFAULT
K_I4NO	=           0.3;  % DEFAULT
K_I5NO	=           0.2;  %  GUO
K_I9FA  =           1;    % DEFAULT
K_I9FNA	=           0.1;  % DEFAULT

K_N2O	=           0.02; %  GUO
K_NO	=           0.04; %  GUO
K_NO2	=           0.3;  %  GUO
K_NO3   =           1.5;  %  GUO
K_OA1	=           0.6;  % DEFAULT
K_OA2	=           1.2;  % DEFAULT
K_OH	=           0.2;  %  GUO
K_OH1	=           0.2;  %  GUO
K_OH2	=           0.2;  %  GUO
K_OH3	=           0.2;  %  GUO
K_OH4	=           0.2;  %  GUO
K_OH5	=           0.2;  %  GUO


K_S1	=           15;     %  GUO
K_S2	=           20;     % DEFAULT
K_S3	=           20;     % DEFAULT
K_S4	=           20;     % DEFAULT
K_S5	=           30;     %  GUO
% 
K_X	=               0.1;    %  GUO

mu_A1	=          0.579099157; %   0.78;  % DEFAULT
mu_A2	=           0.680445092;  %0.78;   % DEFAULT
mu_H	=           4.784892721; %6.25;	% DEFAULT
% 
n_g2	=           0.45;
n_g3	=           0.3;
n_g4	=           0.5;
n_g5	=           0.5;
n_h	    =           0.8;
n_g2	=           0.3;    %  GUO
n_g3	=           0.3;    %  GUO
n_g4	=           0.6;    %  GUO
n_g5	=           0.8;    %  GUO
n_h	    =           0.8;    %  GUO
% 
n_Y	    =           0.9;    
pH	    =           7;
P_N2O_air =     	0;
P_N2_air  =         0.78;
P_NO_air  =       	0;
P_O2_air =      	0.21;
Y_A1	=           0.18;
Y_A2	=           0.06;
Y_H	=               0.67;   %  GUO

X_I2TSS =           0.75; 
X_S2TSS =           0.75;
X_BH2TSS =          0.75;
X_BA2TSS =          0.75;
X_P2TSS =           0.75;


b_Ratkowsky_mu_A1=	0.0255;
b_Ratkowsky_mu_A2=	0.0235;
b_Ratkowsky_mu_H=	0.0625;
c_Ratkowsky_mu_A1=	0.15;
c_Ratkowsky_mu_A2=	0.05;
c_Ratkowsky_mu_H=	0.3;

Temp_Ref	=       15;

theta_b_A1	=       1.116;
theta_b_A2	=       1.116;
theta_b_H	=       1.12;
theta_kla	=       1.024;
theta_k_a	=       1.072;
theta_k_h	=       1.116;
Tmax_Ratkowsky_mu_A1	=   50;
Tmax_Ratkowsky_mu_A2	=   57;
Tmax_Ratkowsky_mu_H	    =   50;
Tmin_Ratkowsky_mu_A1	=   -15;
Tmin_Ratkowsky_mu_A2	=   -25;
Tmin_Ratkowsky_mu_H	    =   -20;

K_SNH_aob1 = 	1.0;
K_SNH_aob2= 	1.0;
K_SNO2_aob= 	8.0;
K_SNO_aob= 	1.0;
K_SO_aob1= 	1;
K_SO_aob2= 	1;
Y_aob	= 0.15; % not used
Y_nob	= 0.041; % not used

K_SO_AOBden1 = 11.399605;
K_IO_AOBden1 = 0.035089;
K_SO_AOBden2 = 11.399605;
K_IO_AOBden2 = 0.035089;
n_AOB        = 0.5;

K_FNA_aob    = 0.0006;
K_FA_aob     = 0.0027;

Y_AnAOB = 0.16;
mu_max_AnAOB = 0.028;
K_NH3_AnAOB = 1.2e-3;
K_HNO2_AnAOB = 2.81e-6;
K_O2_AnAOB = 0.01;
b_AnAOB = 0.001;

n_Y_AOB =15;

% oxygen saturation concentration at 15 degC, based on BSM1
SOSAT1 = 8;
SOSAT2 = 8;
SOSAT3 = 8;
SOSAT4 = 8;
SOSAT5 = 8;
SO2ref_mle = 1;


% Default carbon addition to AS reactors
carb1 = 2; % external carbon flow rate to reactor 1  
carb2 = 0; % external carbon flow rate to reactor 2
carb3 = 0; % external carbon flow rate to reactor 3
carb4 = 0; % external carbon flow rate to reactor 4
carb5 = 0; % external carbon flow rate to reactor 5
CARBONSOURCECONC = 400000; % external carbon source concentration = 400000 mg COD/l

% Default KLa values for AS reactors   (uncomment it if you are not using PI controller)
KLa1 = 2;
KLa2 = 2;


KSO4 = 25;       %Amplification, 500 in BSM1 book
TiSO4 = 0.002;   %I-part time constant (d = 2.88 min)), integral time constant, 0.001 in BSM1 book
TtSO4 = 0.001;   %Antiwindup time constant (d), tracking time constant, 0.0002 in BSM1 book
SO4intstate = 0; %initial value of I-part
SO4awstate = 0;  %initial value of antiwindup I-part
KLa4offset = 120; %reasonable offset value for control around SO4ref
                  % = controller output if the rest is turned off, (1/d)
useantiwindupSO4 = 1;  %0=no antiwindup, 1=use antiwindup for oxygen control
KLa3gain = 1.0; %gain for control signal to reactor 3
KLa5gain = 0.5; %gain for control signal to reactor 5


% aeration equipment capacity (also used by controller for anti-winup)
KLa3_max = 360; %maximum possible KLa value to reactor3
KLa4_max = 360; %maximum possible KLa value to reactor4
KLa5_max = 360; %maximum possible KLa value to reactor5

% external carbon flow addition capacity (also used by controller for anti-winup)
carb1_max = 5; %maximum possible external carbon flow rate to reactor1
carb2_max = 5; %maximum possible external carbon flow rate to reactor2
carb3_max = 5; %maximum possible external carbon flow rate to reactor3
carb4_max = 5; %maximum possible external carbon flow rate to reactor4
carb5_max = 5; %maximum possible external carbon flow rate to reactor5



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RBF
 
% RBF without polymer
%tss_eff_rbf_wop=0.41;   % Calculated separately running Trojan model with PI. 41 % for no poly, 49% for with poly 2 ppm, 57% fo with poly 4 ppm */
%f_ps_rbf_wop=0.003;  %  Calculated separately running Trojan model with PI. 0.003 for no poly, 0.004 for with poly 2 ppm, 0.006 fo with poly 4 ppm */


% RBF with polymer
%tss_eff_rbf_wp=0.57;   % Calculated separately running Trojan model with PI. 41 % for no poly, 49% for with poly 2 ppm, 57% fo with poly 4 ppm */
%f_ps_rbf_wp=0.006;  %  Calculated separately running Trojan model with PI. 0.003 for no poly, 0.004 for with poly 2 ppm, 0.006 fo with poly 4 ppm */


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SETTLER and DELAY data used by all units
   
            
v0_max = 250;
v0 = 474;
r_h = 0.000576;
r_p = 0.00286;
f_ns = 0.00228;
X_t = 3000;
sb_limit = 3000;

feedlayer = 5;
nooflayers = 10;

% to use model with 10 layers for solubles use modeltype 0 (IWA/COST Benchmark)
% to use model with 1 layer for solubles use modeltype 1 (GSP-X implementation)
% to use model with 0 layers for solubles use modeltype 2 (old WEST implementation)
MODELTYPE = [ 0 ];

T = 0.0001;

eff_settler=0.995; % only usde for point settler
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PC

% Efficiency Correction factor
f_corr = 0.65;

% CODpart/CODtot ratio (mean value)
f_X = 0.85;

% Smoothing time constant for qm calculation
t_m = 0.125;

% Ratio of primary sludge flow rate to the influent flow 
f_PS = 0.007;

XVEKTOR_P=[0,0,1,1,1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% thickenerinit_bsm2.m
thickener_perc = 7; % %TSS in thickener underflow
TSS_removal_perc = 98; % %TSS removed from the thickener overflow
X_I2TSS = 0.75;
X_S2TSS = 0.75;
X_BH2TSS = 0.75;
X_BA2TSS = 0.75;
X_P2TSS = 0.75;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% dewateringinit_bsm2.m
dewatering_perc = 28;  % %TSS in dewatered sludge
TSS_removal_perc = 98; % %TSS removed from the dewatering overflow (reject water)
X_I2TSS = 0.75;
X_S2TSS = 0.75;
X_BH2TSS = 0.75;
X_BA2TSS = 0.75;
X_P2TSS = 0.75;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADM
VR_ad=0.1; % not sampled anymore.


S_su =  0.0124;
S_aa =  0.0055;
S_fa =  0.1074;
S_va =  0.0123;
S_bu = 0.0140;
S_pro = 0.0176;
S_ac =  0.0893;
S_h2 =  2.5055e-7;
S_ch4 = 0.0555;
S_IC = 0.0951;
S_IN = 0.0945;
S_I = 0.1309;
X_xc = 0.1079;
X_ch = 0.0205;
X_pr = 0.0842;
X_li = 0.0436;
X_su = 0.3122;
X_aa = 0.9317;
X_fa = 0.3384;
X_c4 = 0.3258;
X_pro = 0.1011;
X_ac = 0.6772;
X_h2 =  0.2848;
X_I =  17.2162;
S_cat =  3.5659e-43;
S_an =  0.0052;
S_hva = 0.0123;   % is actually Sva-
S_hbu = 0.0140;   % is actually Sbu-
S_hpro =  0.0175; % is actually Spro-
S_hac =  0.0890;   % is actually Sac-
S_hco3 = 0.0857;
S_nh3 = 0.0019;
S_gas_h2 = 1.1032e-5;
S_gas_ch4 = 1.6535;
S_gas_co2 = 0.0135;
Q_D = 178.4674;
T_D = 35;
S_D1_D = 0;
S_D2_D = 0;
S_D3_D = 0;
X_D4_D = 0;
X_D5_D = 0;

S_H_ion = 5.4562e-8;

f_sI_xc = 0.1;
f_xI_xc = 0.2;
f_ch_xc = 0.2;
f_pr_xc = 0.2;
f_li_xc = 0.3;  
N_xc = 0.0376/14.0;

N_aa = 0.007;
C_xc = 0.02786;
C_sI = 0.03;
C_ch = 0.0313;
C_pr = 0.03;
C_li = 0.022;
C_xI = 0.03;
C_su = 0.0313;
C_aa = 0.03;
f_fa_li = 0.95;
C_fa = 0.0217;
f_h2_su = 0.19;
f_bu_su = 0.13;
f_pro_su = 0.27;
f_ac_su = 0.41;
%N_bac = 0.08/14.0;

C_bu = 0.025;
C_pro = 0.0268;
C_ac = 0.0313;
C_bac = 0.0313;
Y_su = 0.1;
f_h2_aa = 0.06;
f_va_aa = 0.23;
f_bu_aa = 0.26;
f_pro_aa = 0.05;
f_ac_aa = 0.40;
C_va = 0.024;
Y_aa = 0.08;
Y_fa = 0.06;
Y_c4 = 0.06;
Y_pro = 0.04;
C_ch4 = 0.0156;
Y_ac = 0.05;
Y_h2 = 0.06;
k_dis = 0.5;
k_hyd_ch = 10.0;
k_hyd_pr = 10.0;
k_hyd_li = 10.0;
K_S_IN = 1.0e-4;
k_m_su = 30.0;
K_S_su = 0.5;
pH_UL_aa = 5.5;
pH_LL_aa = 4.0;
k_m_aa = 50.0;
K_S_aa = 0.3;
k_m_fa = 6.0;
K_S_fa = 0.4;
K_Ih2_fa = 5.0e-6;
k_m_c4 = 20.0;
K_S_c4 = 0.2;
K_Ih2_c4 = 1.0e-5;
k_m_pro = 13.0;
K_S_pro = 0.1;
K_Ih2_pro = 3.5e-6;
k_m_ac = 8.0;
K_S_ac = 0.15;
K_I_nh3 = 0.0018;
pH_UL_ac = 7.0;
pH_LL_ac = 6.0;
k_m_h2 = 35.0;
K_S_h2 = 7.0e-6;
pH_UL_h2 = 6.0;
pH_LL_h2 = 5.0;
k_dec_Xsu = 0.02;
k_dec_Xaa = 0.02;
k_dec_Xfa = 0.02;
k_dec_Xc4 = 0.02;
k_dec_Xpro = 0.02;
k_dec_Xac = 0.02;
k_dec_Xh2 = 0.02;
R = 0.083145;       % universal gas constant dm3*bar/(mol*K) = 8.3145 J/(mol*K)
T_base = 298.15;    % 25 degC = 298.15 K
T_op = 308.15;      % operational temperature of AD and interfaces, 35 degC, should really be an input
pK_w_base = 14.0;
pK_a_va_base = 4.86;
pK_a_bu_base = 4.82;
pK_a_pro_base = 4.88;
pK_a_ac_base = 4.76;
pK_a_co2_base = 6.35;
pK_a_IN_base = 9.25;
k_A_Bva = 1.0e10;     % 1e8; according to STR
k_A_Bbu = 1.0e10;     % 1e8; according to STR   
k_A_Bpro = 1.0e10;    % 1e8; according to STR
k_A_Bac = 1.0e10;     % 1e8; according to STR
k_A_Bco2 = 1.0e10;    % 1e8; according to STR
k_A_BIN = 1.0e10;     % 1e8; according to STR
P_atm = 1.013;        % bar
kLa = 200.0;
K_H_h2o_base = 0.0313;
K_H_co2_base = 0.035;
K_H_ch4_base = 0.0014;
K_H_h2_base = 7.8e-4;
k_P = 5.0e4;


iCOD_NO3=-64/14;
iCOD_NO2=(-24+2*(-16)+8)/14;
iCOD_NO=(-24-16)/14;
iCOD_N2O=(2*(-24)-16)/14/2;
iCOD_N2=-24/14;
% parameters for ASM2ADM and ADM2ASM interfaces
% could be put it their own initialisation file
CODequiv = 40.0/14.0;

fsni = 0.0;          % N content of SI, assumed zero in ASM1 and BSM1

% fnbac, fxni and fsni are adjusted to fit the benchmark values of iXB=0.08 and
% iXP=0.06 in the AS. 	
frlixs = 0.7;           % lipid fraction of non-nitrogenous XS in BSM2
frlibac = 0.4;          % lipid fraction of non-nitrogenous biomass in BSM2
frxs_adm = 0.68;        % anaerobically degradable fraction of AS biomass in BSM2
fdegrade_adm = 0;	    % amount of AS XI and XP degradable in AD, zero in BSM2
frxs_as = 0.79;         % aerobically degradable fraction of AD biomass in BSM2
fdegrade_as = 0;	    % amount of AD XI and XP degradable in AS, zero in BSM2
% iN_B=0.086;

pH_adm_init = 7.0;      % initial value of pH in ADM to be used by interfaces for the first sample

% parameters for the pHdelay function
PHTIMECONST = 0.01;

N_I =i_X_P/14.0;
N_bac=i_X_B/14;

CODequiv_NO3= -iCOD_NO3+iCOD_N2;
CODequiv_NO2=-iCOD_NO2+iCOD_N2;
CODequiv_NO=-iCOD_NO+iCOD_N2;
CODequiv_N2O=-iCOD_N2O+iCOD_N2;

fnaa = N_aa*14.0;    % fraction of N in amino acids and Xpr as in ADM1 report
fnxc = N_xc*14.0;    % N content of composite material based on BSM2
fnbac = N_bac*14.0;  % N content of biomass based on BSM1, same in AS and AD
fxni = N_I*14.0;     % N content of inerts XI and XP, same in AS and AD
fsni_adm = N_I*14.0; % N content of SI in the AD system

iN_B=i_X_B;
iN_XP=i_X_P;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ELANS

density_ELANS  = 50000.0;     % biofilm density (g/m3)
z_max_ELANS    = 0.001;       % biofilm thickness  3 mm diameter
pH_set_ELANS   = 7.5;         % pH setpoint
S_O2_sat_ELANS = 8;

SO2refelans   = 0.2; 
KLa4_max_elans = 1000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ELANM

density_ELANM  = 50000.0;     % biofilm density (g/m3)
z_max_ELANM    = 0.001;       % biofilm thickness  3 mm diameter
pH_set_ELANM   = 7.5;         % pH setpoint
S_O2_sat_ELANM = 8;

SO2ref_elanm   = 0.5; 
KLa4_max_elanm = 1000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IFAS
density_IFAS   = 15000.0;     % biofilm density (g/m3)
z_max_IFAS     = 0.001;       % biofilm thickness  3 mm diameter
pH_set_IFAS    = 7.5;         % pH setpoint
S_O2_sat_IFAS  = 8.0;

SO2ref_ifas    = 0.5; 
KLa4_max_ifas  = 1000;
TSSref_ifas=1500;

% IFAS Kinetics
mu_max_AOB=0.8;
K_O2_AOB=0.3;                
K_NH3_AOB=0.043;                        
b_AOB=0.05;                        
Y_AOB=0.21;                         
mu_max_NOB=0.79;                      
K_O2_NOB=1.1;                               
K_HNO2_NOB=3.09e-4;                                      
b_NOB=0.033;                          
Y_NOB=0.059;                               
mu_max_AnAOB=0.028;                  
K_O2_AnAOB=0.01;                                   
K_NH3_AnAOB=1.2e-3;                                           
K_HNO2_AnAOB=2.81e-6;                          
b_AnAOB=0.001;                        
Y_AnAOB=0.16;                                                   
f_i=    0.08;                                                   
i_NXB= 0.08615; 
i_NXI= 0.06003;
k_H=3.0;                             
K_X=0.3;                             
mu_max_HB=6.0;                       
K_O2_HB=0.20;                                                   
K_NH4_HB=0.01;                                                  
K_NO2_HB=0.50;                                                   
K_NO3_HB=0.50;                                                  
K_S_HB=20.0;                                                         
nu_HB=0.80;                                               
b_HB=0.62;                            
Y_HB=0.67;                                                      
K_HNO2_AOB=2.04;

% calibrate parameters for IFAS based on KTH experimetal data
K_O2_NOB=0.7;
K_HNO2_NOB=8e-6;
nu_HB=0.6;

% controller parameters
KTSS=-0.5; % Amplification  -0.5
TiTSS =0.05; %I-part time constant 0.05
TtTSS =0.015; %Antiwindup time constant (d)0.015
useantiwindupTSS = 1;
Qw_max=5000; % m3/d

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Astage kinetics
% Refernce Temp. is 15C. these data are taken from BSM2 manual.
mu_max_H=       4;
K_S_het=        10;
K_O2_het=       0.2;
K_nh4_het=      0.02;
eta_no2=        0.8;
K_no2_het=      0.3;
eta_no3=        0.8;
K_no3_het=      0.3;
q_xs_hyd=       3.0;
K_x=            0.1;
eta_nox=        0.8;
b_H=            0.3;
 

Y_H_astage=       0.5;   % Data are taken from Smitshuijzen, Jeremy, et al.,
Y_H_no2=   0.53;
Y_H_no3=   0.53;
i_n_ss=    0.0;

SO2ref_astage=0.2;
SOSAT_astage=8.24;
KLa4_max_astage=1000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% General parameter for all subsystems
% TEMPMODEL: 0 - influent wastewater temperature is just passed through process reactors 
%            1 - mass balance for the wastewater temperature is used in
%            process reactors
% Note: thickener and dewatering are ideal models, i.e. no impact since T_out =
% T_in, in flow splitters T_out = T_in and in flow combiners mass balance based heat balance is always used.

TEMPMODEL = [ 1 ]; 

% to activate calculation of  dummy states in settler, AS reactors and storage tank set ACTIVATE = 1
ACTIVATE = [ 1 ];


% put the default influent variables into the workspace
% [~,CONSTINFLUENT_BSM2] = rs_print_influent('bsm2');
% [~,AVEDORE] = rs_print_influent('avedore');
