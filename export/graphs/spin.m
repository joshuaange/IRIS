figure_main = figure('Name','Spin','OuterPosition',[10 195 600 350]);
hold on;
timeA = 0;
plot(0,b{1}.q_i(2,1),'o','Color','blue','DisplayName',"X Angular Velocity");
plot(0,b{1}.q_i(2,2),'^','Color','green','DisplayName',"Y Angular Velocity");
plot(0,b{1}.q_i(2,3),'s','Color','red','DisplayName',"Z Angular Velocity");
plot(0,mag(u_i),'+','Color','magenta','DisplayName',"Total Angular Velocity");
plot(0,0,'o','Color','black','DisplayName',"X Angular Acceleration");
plot(0,0,'^','Color','black','DisplayName',"Y Angular Acceleration");
plot(0,0,'s','Color','black','DisplayName',"Z Angular Acceleration");
plot(0,0,'+','Color','black','DisplayName',"Total Angular Acceleration");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/((t_stride+t_step)/2))
            multitude = iteration * ((t_stride+t_step)/2);
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
xlim([0, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Velocity (rad/s)');
legend;
hold off;