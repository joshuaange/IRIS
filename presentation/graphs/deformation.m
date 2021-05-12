figure_main = figure('Name','Deformation','OuterPosition',[10 195 600 350]);
hold on;
timeA = 350;
plot(0,0,'^','Color','blue','HandleVisibility','on','DisplayName',"Elastic Compression");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        timeA = timeA + b{iit}.t_f_i;
    end
    for jit = 1:71
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
            plot((timeA),vpa(s{iit,jit}.D_ij),'^','Color','blue','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([350+22, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Elastic Compression (m)');
hold off;