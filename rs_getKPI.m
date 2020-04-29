function [KPI,ME] = rs_getKPI(runS,c)
    % Simulates a single set of design decisions for a single realization of
    % influent uncertainty and returns plant KPIs.
    rs_addpaths;
    rowXd=runS.rowXd; rowXi=runS.rowXi; I6=runS.I6; G=runS.G;
    % get the key design space and the designID
    load(c.GSAdata,'kspace');
    load(c.MCSdata,'designID');
    try
        KPI = rs_run(I6,G,rowXd,rowXi,designID,kspace,c);
        ME = '';
    catch ME
        KPI = NaN;
        %rethrow(ME)
    end
end