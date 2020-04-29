function X = rs_sampleLHS(N,lb,ub,dist)
    % Returns an LHS sampled input matrix X of size N between bounds lb and
    % ub
    if nargin<4, dist='uniform'; end
    
    if strcmpi(dist,'uniform')
        % can also work with InputSpace objects.
        if nargin==2 && strcmp(class(lb),'InputSpace')
            ub = lb.UpperBounds;
            lb = lb.LowerBounds;
        end

        d = numel(lb);
        Xp=lhsdesign(N,d); % sampling in unit probability space
        % convert probability space to real value space via inverse distribution
        lowerbounds = lb(:)'; L=repmat(lowerbounds,N,1);
        upperbounds = ub(:)'; U=repmat(upperbounds,N,1);
        X = unifinv(Xp,L,U); 
    end
    
    if strcmpi(dist,'normal')
        rs_start_uqlab
        for ii=1:numel(lb) % number of pars
            IOpts.Marginals(ii).Type = 'Gaussian' ;
            IOpts.Marginals(ii).Parameters = [lb(ii) ub(ii)*lb(ii)]; % This is actually mu and std values.
        end
        myInput = uq_createInput(IOpts);
        X = uq_getSample(N);
    end
end