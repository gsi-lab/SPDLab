function InitialX = rs_initialX(c,p,initialize)
    % Returns the select rows from the initial MCS.
    % By Resul Al @DTU
    
    
    rng('default');
    k = 10*p.dim; % initial design size
    if nargin<3, initialize='FeasibleLHS'; end
    
    if strcmpi(initialize,'LHS')
        InitialX = rs_sampleLHS(k,p.lbs,p.ubs); end
    
    if strcmpi(initialize,'FeasibleLHS') % needs kspace and designID
        load(c.GSAdata,'kspace_long','kspace');
        load(c.MCSdata,'space');
        FeasibleX   = rs_FeasibleX(c.MCSdata, c.efflimits); % needs a completed simulation results
        T_FeasibleX = array2table(FeasibleX, 'VariableNames',kspace_long.ParNames);
        FeasibleX = T_FeasibleX{:,kspace.ParNames};
        n_feasible=size(FeasibleX,1);
        if n_feasible<k
            AdditionalX = rs_sampleLHS(k-n_feasible,p.lbs,p.ubs);
            InitialX = [FeasibleX;AdditionalX];
        else
            InitialX = FeasibleX(randsample(n_feasible,k),:);
        end
    end
    
    if strcmpi(initialize,'hLHS-hFeas') % half LHS and hald Feasible
        load(c.GSAdata,'kspace_long','kspace');
        load(c.MCSdata,'space');
        FeasibleX   = rs_FeasibleX(c.MCSdata, c.efflimits); % needs a completed simulation results
        T_FeasibleX = array2table(FeasibleX, 'VariableNames',kspace_long.ParNames);
        FeasibleX = T_FeasibleX{:,kspace.ParNames};
        n_feasible=size(FeasibleX,1);
        if n_feasible<k/2
            AdditionalX = rs_sampleLHS(k-n_feasible,p.lbs,p.ubs);
            InitialX = [FeasibleX;AdditionalX];          
        else
            AdditionalX = rs_sampleLHS(k/2,p.lbs,p.ubs);
            InitialX = [FeasibleX(randsample(n_feasible,k/2),:) ; AdditionalX];
        end
    end
end

