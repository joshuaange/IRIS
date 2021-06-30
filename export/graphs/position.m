figure_main = figure('Name','Position','OuterPosition',[10 195 600 350]);
hold on;
timeA = 0;
plot(0,b{1}.u_i(1,1),'o','Color','blue','DisplayName',"X");
plot(0,b{1}.u_i(1,2),'^','Color','green','DisplayName',"Y");
plot(0,b{1}.u_i(1,3),'s','Color','red','DisplayName',"Z");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/t_int_step)
            multitude = iteration * t_int_step;
            plot(timeA+multitude,b{iit}.x_i(multitude),'o','Color','blue','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.y_i(multitude),'^','Color','green','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.z_i(multitude),'s','Color','red','HandleVisibility','off');
        end
        timeA = timeA + b{iit}.t_f_i;
        plot(timeA,b{iit}.C_i(1),'o','Color','blue','HandleVisibility','off');
        plot(timeA,b{iit}.C_i(2),'^','Color','green','HandleVisibility','off');
        plot(timeA,b{iit}.C_i(3),'s','Color','red','HandleVisibility','off');
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            timeA = timeA + 0.5*T;
            plot(timeA,s{iit,jit}.C_ij(1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.C_ij(2),'^','Color','green','HandleVisibility','off');
            plot(timeA,s{iit,jit}.C_ij(3),'s','Color','red','HandleVisibility','off');
            timeA = timeA + 0.5*T;
            plot(timeA,s{iit,jit}.Cn_ij(1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.Cn_ij(2),'^','Color','green','HandleVisibility','off');
            plot(timeA,s{iit,jit}.Cn_ij(3),'s','Color','red','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([0, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Velocity (m/s)');
legend;
hold off;