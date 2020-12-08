figure_velTime = figure('Name','Velocity-to-Time');
hold on;
timeA = 0;
plot(0,velocityStart(2,1),'o','Color','blue','DisplayName',"X");
plot(0,velocityStart(2,2),'^','Color','green','DisplayName',"Y");
plot(0,velocityStart(2,3),'s','Color','red','DisplayName',"Z");
plot(0,vec_mag(velocityStart),'+','Color','magenta','DisplayName',"Total");
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        for iteration = 1:floor(b{iit}.timeImpact/T)
            multitude = iteration*(T);
            plot(timeA+multitude,b{iit}.dxt(multitude),'o','Color','blue','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.dyt(multitude),'^','Color','green','HandleVisibility','off');
            plot(timeA+multitude,b{iit}.dzt(multitude),'s','Color','red','HandleVisibility','off');
            plot(timeA+multitude,vec_mag([b{iit}.xt(multitude) b{iit}.yt(multitude) b{iit}.zt(multitude); b{iit}.dxt(multitude) b{iit}.dyt(multitude) b{iit}.dzt(multitude)]),'+','Color','magenta','HandleVisibility','off');
        end;
        timeA = timeA + b{iit}.timeImpact;
        plot(timeA,b{iit}.velocityHit(2,1),'o','Color','blue','HandleVisibility','off');
        plot(timeA,b{iit}.velocityHit(2,2),'^','Color','green','HandleVisibility','off');
        plot(timeA,b{iit}.velocityHit(2,3),'s','Color','red','HandleVisibility','off');
        plot(timeA,vec_mag(b{iit}.velocityHit),'+','Color','magenta','HandleVisibility','off');
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            %Middle point before launch
            timeA = timeA + 0.5*T;
            plot(timeA,0.5*(s{iit,jit}.velocityEnd(2,1)+b{iit}.velocityHit(2,1)),'o','Color','blue','HandleVisibility','off');
            plot(timeA,0.5*(s{iit,jit}.velocityEnd(2,2)+b{iit}.velocityHit(2,2)),'^','Color','green','HandleVisibility','off');
            plot(timeA,0.5*(s{iit,jit}.velocityEnd(2,3)+b{iit}.velocityHit(2,3)),'s','Color','red','HandleVisibility','off');
            plot(timeA,0.5*(vec_mag(s{iit,jit}.velocityEnd)+vec_mag(b{iit}.velocityHit)),'+','Color','magenta','HandleVisibility','off');
            %Normal Graph
            timeA = timeA + 0.5*T;
            plot(timeA,s{iit,jit}.velocityEnd(2,1),'o','Color','blue','HandleVisibility','off');
            plot(timeA,s{iit,jit}.velocityEnd(2,2),'^','Color','green','HandleVisibility','off');
            plot(timeA,s{iit,jit}.velocityEnd(2,3),'s','Color','red','HandleVisibility','off');
            plot(timeA,vec_mag(s{iit,jit}.velocityEnd),'+','Color','magenta','HandleVisibility','off');
        end;
    end;
end;
totalTimeA = double(timeA);
xlim([0 totalTimeA+T]);
xlabel('Time elapsed (s)');
ylabel('Velocity (m/s)');
legend;
hold off;