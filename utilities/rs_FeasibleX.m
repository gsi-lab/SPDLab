function FeasibleX = rs_FeasibleX(simdata)
    % Returns FeasibleX matrix which was evaluated in design space
    % exploration step.
    T = rs_bigT(simdata);
    FeasibleX=T{T.Status=='Feasible','X'};
end