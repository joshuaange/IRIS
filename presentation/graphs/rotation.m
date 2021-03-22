figure_main = figure('Name','Rotation','OuterPosition',[10 195 600 350]);
hold on;
timeA = 0;
plot(0,I_i(2,1),'o','Color','blue','DisplayName',"X");
plot(0,I_i(2,2),'^','Color','green','DisplayName',"Y");
plot(0,I_i(2,3),'s','Color','red','DisplayName',"Z");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/T_units)
            multitude = iteration * T_units;
            plot(timeA+multitude,b{iit}.q_i(2,1)*multitude,'o','Color','blue','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.q_i(2,2)*multitude,'^','Color','green','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.q_i(2,3)*multitude,'s','Color','red','HandleVisibility','off');
        end
        timeA = timeA + b{iit}.t_f_i;
        plot(timeA,b{iit}.I_i(2,1),'o','Color','blue','HandleVisibility','off');
        plot(timeA,b{iit}.I_i(2,2),'^','Color','green','HandleVisibility','off');
        plot(timeA,b{iit}.I_i(2,3),'s','Color','red','HandleVisibility','off');
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
            plot(timeA,s{iit,jit}.I_ij(2,1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.I_ij(2,1),'^','Color','green','HandleVisibility','off');
            plot(timeA,s{iit,jit}.I_ij(2,1),'s','Color','red','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([0, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Rotation (rad)');
legend;
hold off;