function [T,M] = rs_print_influent(influent)
    % Returns/prints the influent data
    T = table;
    T.index = [1:24]';

    if nargin<1
        T1 = rs_print_influent('bsm2');
        T2 = rs_print_influent('avedore');
        T3 = rs_print_influent('lynetten');
        T4 = rs_print_influent('valladolid');

        T.BSM2 = T1.data;
        T.Avedore = T2.data;
        T.Lynetten = T3.data;
        T.Valladolid = T4.data;
    elseif strcmpi(influent,'bsm2') % Src: BSM2 manuel
        %             T.data = [0 27.22 58.17 92.49 363.94 50.68 0 0 0 0 23.85 5.65 16.12 7 380.34 20648.36 14.85 0 0 0 0 0 0 0]';
        T.data = [0 27.22 58.17 92.49 363.94 50.68 0.01 0.01 0.01 0.01 23.85 5.65 16.12 7 380.34 20648.36 14.85 0.01 0.01 0.01 0.01 0.01 0.01 0.01]';
    elseif strcmpi(influent,'avedore') % Src: Hande's Thesis
        %             T.data = [0,23.48,107.85,46.61,125.82,0,0,0,0,0,32.85,0,4.9,7,129.32,72000,15,0,0,0,0,0,0,0]';
        T.data = [0,23.48,107.85,46.61,125.82,0.01,0.01,0.01,0.01,0.01,32.85,0,4.9,7,129.32,72000,15,0.01,0.01,0.01,0.01,0.01,0.01,0.01]';  % modified to run simulation
    elseif strcmpi(influent,'lynetten') % Src: Hande's Thesis
        T.data = [0 56.52 153.25 89.98 357.59 0.01 0.01 0.01 0.01 0 45.60 0 5.40 7 335.68 162465 15 0.01 0.01 0.010 0.010 0.01 0.01 0.01]';  % modified to run simulation
    elseif strcmpi(influent,'valladolid') % Src: PioneerSTP inventory
        T.data = [0 21 205 15 122 0.01 0.01 0.01 0.01 0 19 5 7 7 102.75 213408 15 0.01 0.01 0.01 0.01 0.01 0.01 0.01]';  % modified to run simulation

    end
    T.units = {'days','g COD/m3','g COD/m3','g COD/m3','g COD/m3','g COD/m3','g COD/m3','g COD/m3','g -COD/m3','g N/m3','g N/m3','g N/m3','g N/m3','mole/m3','g/m3','m3/d','C','g N/m3','g N/m3','g N/m3','g N/m3','g COD/m3','g COD/m3','g COD/m3'}';
    T.Properties.RowNames = {'Time','SI','SS','XI','XS','XBH','XBA','XP','SO','SNO3','SNH','SND','XND','SALK','TSS','Q','T','SNO2','SNO','SN2O','SN2','XBA2','XANAOB','XC'};
    if nargout==2, M=createData(T); 
    end
end

function M=createData(T)
    % returns vector form data
    M=zeros(2,height(T));
    M(1,:) = T.data';
    M(2,:) = T.data';
    M(2,1) = 1000;
end