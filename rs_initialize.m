function IN = rs_initialize(X,c)
    % finds the initial conditions for each row of a design matrix X.
    rs_addpaths
    k = size(X,1); % # of design points
    
    IN=struct;
    if k>1
        pp = gcp('nocreate'); if isempty(pp); pp = parpool('local',20); end; 
        fprintf('%d design points will be initialized in total with parfor.\n\n',k)   
        parfor_progress(k);
        parfor i=1:k
            rowXd=X(i,:);
            [I6,G]    = rs_initdesign(rowXd,c);
            IN(i).I6 = I6;
            IN(i).G  = G;
            parfor_progress;
        end
        parfor_progress(0);
    else
        fprintf('\nDesign will be initialized at the new candidate design point. \n')
        rowXd  = X;
        [I6,G] = rs_initdesign(rowXd,c);
        IN.I6  = I6;
        IN.G   = G;
    end
    fprintf('\nInitialization is complete. \n')
    %if k>1, save('initials/INconditions4MCS.mat','IN'); end
end
