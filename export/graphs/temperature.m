figure_main = figure('Name','Temperature','OuterPosition',[10 195 600 350]);
hold on;
timeA = 0;
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/((t_stride+t_step)/2))
            multitude = iteration * ((t_stride+t_step)/2);
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
xlim([0, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Temperature (K)');
legend;
hold off;