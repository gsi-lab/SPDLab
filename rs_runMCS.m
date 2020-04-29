% Perform design space exploration using Monte Carlo simulations 
% within the design space of a given configuration

tic; clc; clear; rng(42); rs_addpaths; 

% Choose the configuration
cID = 6; 
[~, designIDs] = rs_synthesize(rs_superstructure); 
designID = designIDs{cID};  % designID = {'ERBF','IFAS','ADM','BP_side'};

% Generate and sample the design space
space    = rs_designSpace(designID); show(space);
N        = 50*numel(space.ParNames);
X        = sample_space(space,N,'LHS');
influent = 'avedore'; % 'bsm2', 'lynetten', 'valladolid'
filename = ['results/MCS_' char(join(designID,'_')) '_' influent];

% Perform Parallel Monte Carlo Simulations
pp = gcp('nocreate'); if isempty(pp); pp = parpool('local',20); end;
parfor_progress(N);
parfor i=1:N
    try
        if exist(sprintf('mcsims/row%d',i),'file')==2, continue; end
        designrow = table2struct(array2table(X(i,:), 'VariableNames', space.ParNames));
        [I6,G]    = cr_initdesign(designrow,influent,designID)
        KPI       = cr_run(designrow,designID,I6,G,influent);
        %
        D(i).KPI  = KPI;
        D(i).I6   = I6;
        D(i).G    = G;
        D(i).S    = '';
        m=matfile(sprintf('mcsims/row%d',i),'writable',true); m.KPI=KPI; m.I6=I6; m.G=G;
        fprintf('Finished a successful run.\n')
    catch ME
        D(i).KPI  = NaN;
        D(i).I6   = NaN;
        D(i).G    = NaN;
        D(i).S    = ME;
        %rethrow(ME)
    end
    parfor_progress;
end
parfor_progress(0)
ttoc = toc;
save(filename)


%% Gather the results of MCS
parfor_progress(N);
parfor i=1:N
    try
        m=matfile(sprintf('mcsims/row%d',i),'writable',true);
        D(i).KPI  = m.KPI;
        D(i).I6   = m.I6;
        D(i).G    = m.G;
        D(i).S    = '';
    catch ME
        D(i).KPI  = NaN;
        D(i).I6   = NaN;
        D(i).G    = NaN;
        D(i).S    = ME;
        %rethrow(ME)
    end
    parfor_progress;
end
parfor_progress(0)
