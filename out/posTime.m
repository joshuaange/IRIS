figure_posTime = figure('Name','Position-to-Time');
hold on;
timeA = 0;
plot(0,velocityStart(1,1),'o','Color','blue','DisplayName',"X");
plot(0,velocityStart(1,2),'^','Color','green','DisplayName',"Y");
plot(0,velocityStart(1,3),'s','Color','red','DisplayName',"Z");
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        for iteration = 1:floor(b{iit}.timeImpact/T)
            multitude = iteration*(T);
            plot(timeA+multitude,b{iit}.xt(multitude),'o','Color','blue','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.yt(multitude),'^','Color','green','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.zt(multitude),'s','Color','red','HandleVisibility','off');
        end;
        timeA = timeA + b{iit}.timeImpact;
        plot(timeA,b{iit}.C(1),'o','Color','blue','HandleVisibility','off');
        plot(timeA,b{iit}.C(2),'^','Color','green','HandleVisibility','off');
        plot(timeA,b{iit}.C(3),'s','Color','red','HandleVisibility','off');
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
            plot(timeA,s{iit,jit}.C_new(1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.C_new(2),'^','Color','green','HandleVisibility','off');
            plot(timeA,s{iit,jit}.C_new(3),'s','Color','red','HandleVisibility','off');
        end;
    end;
end;
totalTimeA = double(timeA);
xlim([0 totalTimeA+T]);
xlabel('Time elapsed (s)');
ylabel('Position (m)');
legend;
hold off;
writematrix("Time Elapsed: " + totalTimeA + "s",'Test Output','WriteMode','append');