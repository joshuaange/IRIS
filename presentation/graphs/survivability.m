sfigure_main = figure('Name','Survivability','OuterPosition',[10 195 600 350]);
hold on;
timeA = 350;
plot(0,0,'o','Color','blue','DisplayName',"Pod");
plot(0,0,'^','Color','red','DisplayName',"Contents");
for iit = 1:i_max
    if isempty(b{iit}) == 0
        timeA = timeA + b{iit}.t_f_i;
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
            plot(timeA,s{iit,jit}.S_pod_ij,'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.S_contents_ij,'^','Color','red','HandleVisibility','off');
        end
    end
end

grid minor;
xlim([350+22, double(timeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Survivability Metric');
legend;
hold off;