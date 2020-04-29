function INFLUENT = rs_get_influent(influent)
    % Returns an influent struct, INFLUENT
    INFLUENT = struct;
    T = rs_print_influent(influent);
    for r=1:length(T.Row)
        row = T.Row{r};
        INFLUENT.(row) = T.data(r);
    end
end