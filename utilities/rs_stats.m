function [stats,R2,SSE,SST,MSE,RMSE,AAD,ARE,RE] = rs_stats(Yval,Yfit)
    % Calculate error stats for a given pair of data (Yval) and predictions (Yfit).
    % By Resul Al @DTU.

    % Compare inputs
    if ~all(size(Yval)==size(Yfit)); error 'Yval and Yfit must be the same size'; end

    err  = Yval-Yfit; 
    SSE  = sum((err).^2);       % Sum of squared errors
    SST  = sum((Yval-mean(Yval)).^2); % also called TSS, calculated from data only.
    R2   = corr(Yval,Yfit).^2;  % R2 = 1 - SSE/SST;
    MSE  = mean((err).^2);      % Mean squared error
    RMSE = sqrt(MSE);           % Root mean squared error
    AAD  = mean(abs(err));      % Average Absolute Deviation, also called MAE
    RE   = abs(err)./abs(Yval); % Relative Error
    ARE  = mean(RE);            % Average Relative Error

    stats.R2   = R2;
    stats.SSE  = SSE;
    stats.SST  = SST;
    stats.MSE  = MSE;
    stats.RMSE = RMSE;
    stats.AAD  = AAD;
    stats.ARE  = ARE;
    stats.RE   = RE;
end