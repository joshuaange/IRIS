bfigure_main = figure('Name','Reactions','OuterPosition',[10 195 600 350]);
hold on;
timeA = 0;
plot(0,0,'o','Color','green','DisplayName',"Initial Velocity");
plot(0,0,'^','Color','black','DisplayName',"Rotational");
plot(0,0,'^','Color','green','DisplayName',"Normal");
plot(0,0,'s','Color','blue','DisplayName',"Friction");
plot(0,0,'s','Color','green','DisplayName',"Gravity");
plot(0,0,'^','Color','red','DisplayName',"Elastic");
plot(0,0,'o','Color','red','DisplayName',"Final Velocity");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        timeA = timeA + b{iit}.t_f_i;
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
            plot(timeA,mag(s{iit,jit}.v_ij),'o','Color','green','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.A_r_ij),'^','Color','black','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.A_n_ij),'^','Color','green','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.A_f_ij),'s','Color','blue','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.A_g_ij),'s','Color','green','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.A_e_ij),'^','Color','red','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.V_ij),'o','Color','red','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([0, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Velocity Influence (m/s)');
legend;
hold off;