function OBJ = rs_objective(KPI,c)
% process the objective defined in string of c.objective
    
    OBJ = KPI.(c.objective);
end

