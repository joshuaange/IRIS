figure_main = figure('Name','Temperature','OuterPosition',[10 195 600 350]);
hold on;
timeA = 350;
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/T_units)
            multitude = iteration * T_units;
            plot(timeA+multitude,b{iit}.T_i,'o','Color','blue','HandleVisibility','off');
        end
        timeA = timeA + b{iit}.t_f_i;
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            plot(timeA,s{iit,jit}.T_s_ij,'^','Color','blue','HandleVisibility','off');
            timeA = timeA + T;
            plot(timeA,s{iit,jit}.T_f_ij,'^','Color','blue','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([350+22, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Temperature (K)');
legend;
hold off;