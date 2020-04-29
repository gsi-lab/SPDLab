function T = rs_bigT(data)
    
    load(data);
    nD  = [1:numel(D)]';
    COD = NaN(size(D))'; 
    TN  = NaN(size(D))'; 
    SNH = NaN(size(D))'; 
    EQI = NaN(size(D))'; 
    CH4 = NaN(size(D))'; 
    OCI = NaN(size(D))'; 

    for d=1:numel(D)
        try, COD(d) = D(d).KPI.COD;  catch, end
        try, TN(d)  = D(d).KPI.TN ;  catch, end
        try, SNH(d) = D(d).KPI.SNH;  catch, end
        try, EQI(d) = D(d).KPI.EQI;  catch, end
        try, CH4(d) = D(d).KPI.Methane;  catch, end
        try, OCI(d) = D(d).KPI.OCI;  catch, end
    end
    YT = table(nD, COD, TN, SNH, EQI, CH4, OCI);
    XT = array2table(X,'VariableNames',space.ParNames);
    XT.nD = nD;
    T = join(YT,XT);
    T.X = X;
    T.Y = [COD TN SNH EQI CH4 OCI];
    fprintf('Checking data ...\n%.2f percent of simulations did not run successfully.\n', 100*errorrate(D))
    T = addstatus(T);
end

function rate = errorrate(D)
    e=0;
    for d=1:numel(D)
        if ~isempty(D(d).S)
            e=e+1;
        end
    end
    rate=e/numel(D);
end

function T = filtertable(T,VarName,maxLimit)
    rows = T.(VarName) < maxLimit; % logical vector
    T.Status(~rows) = [VarName ' Violated'];
end

function T = addstatus(T) % Returns a new ResultsTable satisfying EQ Limits by adding a new column named Status to the end
    
    T.Status = strings(height(T),1); % an empty string array
    % Effluent_Quality_Limits introduced
    T=filtertable(T,'TN',15);
    T=filtertable(T,'SNH',5);
    T=filtertable(T,'COD',100);
    T.Status(ismissing(categorical(T.Status))) = 'Feasible';
    T.Status = categorical(T.Status);
    summary(T.Status)
end
