figure_main = figure('Name','Velocity','OuterPosition',[10 195 600 350]);
hold on;
timeA = 0;
plot(0,b{1}.u_i(2,1),'o','Color','blue','DisplayName',"X");
plot(0,b{1}.u_i(2,2),'^','Color','green','DisplayName',"Y");
plot(0,b{1}.u_i(2,3),'s','Color','red','DisplayName',"Z");
plot(0,mag(b{1}.u_i),'+','Color','magenta','DisplayName',"Total");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/((t_stride+t_step)/2))
            multitude = iteration * ((t_stride+t_step)/2);
            plot(timeA+multitude,b{iit}.dx_idt(multitude),'o','Color','blue','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.dy_idt(multitude),'^','Color','green','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.dz_idt(multitude),'s','Color','red','HandleVisibility','off');
            plot(timeA+multitude,mag([0,0,0;b{iit}.dx_idt(multitude),b{iit}.dy_idt(multitude),b{iit}.dz_idt(multitude)]),'+','Color','magenta','HandleVisibility','off');
        end
        timeA = timeA + b{iit}.t_f_i;
        plot(timeA,b{iit}.v_i(2,1),'o','Color','blue','HandleVisibility','off');
        plot(timeA,b{iit}.v_i(2,2),'^','Color','green','HandleVisibility','off');
        plot(timeA,b{iit}.v_i(2,3),'s','Color','red','HandleVisibility','off');
        plot(timeA,mag(b{iit}.v_i),'+','Color','magenta','HandleVisibility','off');
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            timeA = timeA + 0.5*T;
            plot(timeA,0.5*s{iit,jit}.v_ij(2,1)+0.5*s{iit,jit}.V_ij(2,1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,0.5*s{iit,jit}.v_ij(2,2)+0.5*s{iit,jit}.V_ij(2,2),'^','Color','green','HandleVisibility','off');
            plot(timeA,0.5*s{iit,jit}.v_ij(2,3)+0.5*s{iit,jit}.V_ij(2,3),'s','Color','red','HandleVisibility','off');
            plot(timeA,0.5*mag(s{iit,jit}.v_ij)+0.5*mag(s{iit,jit}.V_ij),'+','Color','magenta','HandleVisibility','off');
            timeA = timeA + 0.5*T;
            plot(timeA,s{iit,jit}.V_ij(2,1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.V_ij(2,2),'^','Color','green','HandleVisibility','off');
            plot(timeA,s{iit,jit}.V_ij(2,3),'s','Color','red','HandleVisibility','off');
            plot(timeA,mag(s{iit,jit}.V_ij),'+','Color','magenta','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([0, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Velocity (m/s)');
legend;
hold off;