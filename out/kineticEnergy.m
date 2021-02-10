figure_main = figure('Name','Kinetic Energy','OuterPosition',[10 195 600 350]);
hold on;
timeA = 0;
plot(0,double(b{1}.KE_s_i),'d','Color','blue','HandleVisibility','on','DisplayName',"Kinetic Energy");
plot(0,0,'o','Color','red','HandleVisibility','on','DisplayName',"Potential Energy");
plot(0,0,'s','Color','black','HandleVisibility','on','DisplayName',"Total Energy");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(b{iit}.t_f_i/T_units)
            multitude = iteration * T_units;
            plot(double(timeA+multitude),double(0.5*m*mag([b{iit}.x_i(multitude) b{iit}.y_i(multitude) b{iit}.z_i(multitude); b{iit}.dx_i(multitude) b{iit}.dy_i(multitude) b{iit}.dz_i(multitude)])^2),'d','Color','blue','HandleVisibility','off');  
            plot(double(timeA+multitude),m*g*(b{iit}.z_i(multitude)-L(b{iit}.x_i(multitude),b{iit}.y_i(multitude))),'o','Color','red','HandleVisibility','off');
            plot(double(timeA+multitude),double(0.5*m*mag([b{iit}.x_i(multitude) b{iit}.y_i(multitude) b{iit}.z_i(multitude); b{iit}.dx_i(multitude) b{iit}.dy_i(multitude) b{iit}.dz_i(multitude)])^2)+m*g*(b{iit}.z_i(multitude)-L(b{iit}.x_i(multitude),b{iit}.y_i(multitude))),'s','Color','black','HandleVisibility','off');
        end
        timeA = timeA + b{iit}.t_f_i;
        plot(timeA,b{iit}.KE_f_i,'d','Color','blue','HandleVisibility','off');
        plot(timeA,0,'o','Color','red','HandleVisibility','off');    
        plot(timeA,b{iit}.KE_f_i,'s','Color','black','HandleVisibility','off');  
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            plot((timeA),double(s{iit,jit}.KE_s_ij),'d','Color','blue','HandleVisibility','off');
            timeA = timeA + T;
            plot((timeA),double(s{iit,jit}.KE_f_ij),'d','Color','blue','HandleVisibility','off');
            plot((timeA),0,'o','Color','red','HandleVisibility','off');    
            plot((timeA),double(s{iit,jit}.KE_f_ij),'s','Color','black','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([double(b{1}.t_f_i), double(timeA+T)]);
legend on;
xlabel('Time elapsed (s)');
ylabel('Energy (J)');
hold off;