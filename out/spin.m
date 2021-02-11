figure_main = figure('Name','Spin','OuterPosition',[10 195 600 350]);
hold on;
timeA = 0;
plot(0,q_i(2,1),'o','Color','blue','DisplayName',"X");
plot(0,q_i(2,2),'^','Color','green','DisplayName',"Y");
plot(0,q_i(2,3),'s','Color','red','DisplayName',"Z");
plot(0,mag(u_i),'+','Color','magenta','DisplayName',"Total");
plot(0,0,'o','Color','black','DisplayName',"X Influence");
plot(0,0,'^','Color','black','DisplayName',"Y Influence");
plot(0,0,'s','Color','black','DisplayName',"Z Influence");
plot(0,0,'+','Color','black','DisplayName',"Total Influence");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/T_units)
            multitude = iteration * T_units;
            plot(timeA+multitude,b{iit}.q_i(2,1),'o','Color','blue','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.q_i(2,2),'^','Color','green','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.q_i(2,3),'s','Color','red','HandleVisibility','off');
            plot(timeA+multitude,mag(b{iit}.q_i),'+','Color','magenta','HandleVisibility','off');
        end
        timeA = timeA + b{iit}.t_f_i;
        plot(timeA,b{iit}.q_i(2,1),'o','Color','blue','HandleVisibility','off');
        plot(timeA,b{iit}.q_i(2,2),'^','Color','green','HandleVisibility','off');
        plot(timeA,b{iit}.q_i(2,3),'s','Color','red','HandleVisibility','off');
        plot(timeA,mag(b{iit}.q_i),'+','Color','magenta','HandleVisibility','off');
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            plot(timeA,s{iit,jit}.q_ij(2,1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.q_ij(2,2),'^','Color','green','HandleVisibility','off');
            plot(timeA,s{iit,jit}.q_ij(2,3),'s','Color','red','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.q_ij),'+','Color','magenta','HandleVisibility','off');
            timeA = timeA + 0.5*T;
            plot(timeA,s{iit,jit}.p_ij(2,1),'o','Color','black','HandleVisibility','off');
            plot(timeA,s{iit,jit}.p_ij(2,2),'^','Color','black','HandleVisibility','off');
            plot(timeA,s{iit,jit}.p_ij(2,3),'s','Color','black','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.p_ij),'+','Color','black','HandleVisibility','off');
            timeA = timeA + 0.5*T;
            plot(timeA,s{iit,jit}.Q_ij(2,1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.Q_ij(2,1),'^','Color','green','HandleVisibility','off');
            plot(timeA,s{iit,jit}.Q_ij(2,1),'s','Color','red','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.Q_ij),'+','Color','magenta','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([double(b{1}.t_f_i), double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Velocity (rad/s)');
legend;
hold off;