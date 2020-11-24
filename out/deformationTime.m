figure_posTime = figure('Name','Deformation-to-Time');
hold on;
timeA = 0;
plot(0,0,'^','Color','blue','DisplayName',"Elastic Compression",'MarkerFaceColor','blue');
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        timeA = timeA + b{iit}.timeImpact;
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
            plot(timeA,(s{iit,jit}.deformation),'^','Color','blue','HandleVisibility','off','MarkerFaceColor','blue');
        end;
    end;
end;
totalTimeA = double(timeA);
xlim([0 totalTimeA+T]);
xlabel('Time elapsed (s)');
ylabel('Deformation (m)');
legend;
hold off;