%% produce lightUA.mat
clc; clear; rs_addpaths;

c.objective   = 'OCI';
c.uncertainty = 'light';
c.efflimits   = [100,10,5];

load InitialR % 3000 sims
missing={};
pp = gcp('nocreate'); if isempty(pp); pp = parpool('local',20); end; 
parfor_progress(length(R));
parfor r=1:length(R)
    try
        m=matfile([c.uncertainty 'UA/',R(r).runID],'writable',true); 
        P(r).runID = R(r).runID;
        P(r).KPI = m.KPI;
        P(r).ME = m.ME;
    catch
        missing = [missing R(r).runID];
        P(r).runID = R(r).runID;
        P(r).KPI = NaN;
        P(r).ME = NaN;
    end
    parfor_progress;
end
parfor_progress(0);

T = struct2table(P); T.Properties.RowNames = T.runID; T.runID=[];
T(~strcmp(T.ME,''),:) % didn't work

[r,M]=rs_KPIranges(T,c); % based on initial simulations


% c2n: single obj, multiple modeled constraints.
maxCOD=c.efflimits(1); maxTN=c.efflimits(2); maxSNH=c.efflimits(3); 
f_observations  =  M.OBJ./r.OBJ;
g1_observations = (M.COD-maxCOD)./r.COD;
g2_observations = (M.SNH-maxSNH)./r.SNH;
g3_observations = (M.TN-maxTN)./r.TN;
g_observations  = {g1_observations g2_observations g3_observations};


load InitialX
InitialObjectiveObservations  = f_observations;
InitialConstraintObservations = g_observations;
save(['results/' c.uncertainty 'UA'],'InitialX','InitialObjectiveObservations','InitialConstraintObservations','r','M')