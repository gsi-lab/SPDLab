function [parnames,lbounds,ubounds] = rs_getSet(c)
    % Returns parameter sets with parnames in a cell array and defaults and upper and lower bounds in arrays.
    % By Resul Al @DTU
    
    [INFLUENT] = rs_get_influent(c.influent);
    mu = [INFLUENT.XI INFLUENT.SI INFLUENT.SS INFLUENT.SNH];
    
    % 7 parameters from GSIN-09
    parnames = {'X_I','S_I', 'S_S', 'S_NH'};
    
    if strcmpi(c.uncertainty,'light')
        inputunc = [0.1 0.1 0.1 0.1]; end
    
    if strcmpi(c.uncertainty,'heavy')
        inputunc = [0.3 0.3 0.3 0.3]; end % Bozkurt et al., 2016

    % uniform
    lbounds = mu-mu.*inputunc;
    ubounds = mu+mu.*inputunc;
    
    % return normal instead
    lbounds = mu;
    ubounds = inputunc;
end
