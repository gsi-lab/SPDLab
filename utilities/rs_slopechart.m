function rs_slopechart(S1,S2)
    if nargin<1, [S1,S2] = getDefaults; end
    
    Td = rs_print_influent;
    T          = table;
    T.S1       = S1(:);
    T.S2       = S2(:);
    T.Row      = Td.Row(2:end);
    T.units    = Td.units(2:end);
    COD_states = T(strcmpi(T.units,'g COD/m3') ,:);
    N_states   = T(strcmpi(T.units,'g N/m3') ,:);
    
    colororder = [  0.00  0.00  1.00
                    0.00  0.50  0.00 
                    1.00  0.00  0.00 
                    0.00  0.75  0.75
                    0.75  0.00  0.75
                    0.75  0.75  0.00 
                    0.25  0.25  0.25
                    0.75  0.25  0.25
                    0.95  0.95  0.00 
                    0.25  0.25  0.75
                    0.75  0.75  0.75
                    0.00  1.00  0.00 
                    0.76  0.57  0.17
                    0.54  0.63  0.22
                    0.34  0.57  0.92
                    1.00  0.10  0.60
                    0.88  0.75  0.73
                    0.10  0.49  0.47
                    0.66  0.34  0.65
                    0.99  0.41  0.23 ];
    figure(1)
    title('COD States Change'); ylabel('g COD/m3');
    set(gca, 'ColorOrder', colororder);
    set(gca,'XLim',[0,3],'YLim',[-10,Inf]);
    xticks([0 1 2 3])
    xticklabels({'','State 1','State 2',''});
    ymax = max(max([COD_states.S1 COD_states.S2]));
    line([1,1],[0,ymax+50],'LineStyle','--'); hold on;
    line([2,2],[0,ymax+50],'LineStyle','--'); 
    grid on
    grid minor
    x=[1 2];
    for i=1:height(COD_states)
        y = [COD_states.S1(i) COD_states.S2(i)]; 
        if ~any(y), continue; end
        h(i)=plot(x,y,'LineWidth',1.5); 
        text(2,y(2),COD_states.Row{i})
    end
    hold off
    
    figure(2)
    title('N States Change'); ylabel('g N/m3');
    set(gca, 'ColorOrder', colororder);
    set(gca,'XLim',[0,3],'YLim',[-2,Inf]);
    xticks([0 1 2 3])
    xticklabels({'','State 1','State 2',''});
    ymax = max(max([N_states.S1 N_states.S2]));
    line([1,1],[0,ymax+10],'LineStyle','--'); hold on;
    line([2,2],[0,ymax+10],'LineStyle','--'); 
    grid on
    grid minor
    x=[1 2];
    N_states=sortrows(N_states,'S1','descend');
    for i=1:height(N_states)
        y = [N_states.S1(i) N_states.S2(i)]; 
        if ~any(y), continue; end
        hn(i)=plot(x,y,'LineWidth',1.5); 
        text(2,y(2),N_states.Row{i})
    end
    hold off
end

function [S1,S2] = getDefaults
    T = rs_print_influent;
    S1=T.BSM2(2:end,:); S2=T.Avedore(2:end,:);
end

function [T,M] = rs_print_influent(influent)
    % Returns/prints the influent data
    T = table;
    T.index = [1:24]';
    
    if nargin<1 
        T1 = rs_print_influent('bsm2');
        T2 = rs_print_influent('Avedore');
        T.BSM2 = T1.data;
        T.Avedore = T2.data;
    else
        if strcmpi(influent,'bsm2') % Src: BSM2 manuel
            T.data = [0 27.2261906234849 58.1761856778940 92.4990010554089 363.943473006786 50.6832881484832 0 0 0 0 23.8594656340447 5.65160603095694 16.1298160611318 7 380.344321658009 20648.3612112084 14.8580800598190 0 0 0 0 0 0 0]';
        elseif strcmpi(influent,'Avedore') % Src: Hande's Thesis
            T.data = [0,23.48,107.85,46.61,125.82,0,0,0,0,0,32.85,0,4.9,7,129.32,72000,15,0,0,0,0,0,0,0]';
        end        
    end
    T.units = {'days','g COD/m3','g COD/m3','g COD/m3','g COD/m3','g COD/m3','g COD/m3','g COD/m3','g -COD/m3','g N/m3','g N/m3','g N/m3','g N/m3','mole/m3','g/m3','m3/d','C','g N/m3','g N/m3','g N/m3','g N/m3','g COD/m3','g COD/m3','g COD/m3'}';
    T.Properties.RowNames = {'Time','SI','SS','XI','XS','XBH','XBA','XP','SO','SNO3','SNH','SND','XND','SALK','TSS','Q','T','SNO2','SNO','SN2O','SN2','XBA2','XANAOB','XC'};
    if nargout==2, M=createData(T); end
end

function M=createData(T)
    % returns vector form data
    M=zeros(2,height(T));
    M(1,:) = T.data';
    M(2,:) = T.data';
    M(2,1) = 1000;  
end
