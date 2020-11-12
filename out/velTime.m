figure_velTime = figure('Name','Velocity-to-Time');
hold on;
timeB = 0;
plot(0,velocityStart(2,1),'o','Color','blue','DisplayName',"X");
plot(0,velocityStart(2,2),'^','Color','green','DisplayName',"Y");
plot(0,velocityStart(2,3),'s','Color','red','DisplayName',"Z");
plot(0,vec_mag(velocityStart),'+','Color','magenta','DisplayName',"Total");
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        timeB = timeB + b{iit}.timeImpact;
        plot(timeB,b{iit}.velocityHit(2,1),'o','Color','blue','HandleVisibility','off');
        plot(timeB,b{iit}.velocityHit(2,2),'^','Color','green','HandleVisibility','off');
        plot(timeB,b{iit}.velocityHit(2,3),'s','Color','red','HandleVisibility','off');
        plot(timeB,vec_mag(b{iit}.velocityHit),'+','Color','magenta','HandleVisibility','off');
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            timeB = timeB + T;
            plot(timeB,s{iit,jit}.velocityEnd(2,1),'o','Color','blue','HandleVisibility','off');
            plot(timeB,s{iit,jit}.velocityEnd(2,2),'^','Color','green','HandleVisibility','off');
            plot(timeB,s{iit,jit}.velocityEnd(2,3),'s','Color','red','HandleVisibility','off');
            plot(timeB,vec_mag(s{iit,jit}.velocityEnd),'+','Color','magenta','HandleVisibility','off');
        end;
    end;
end;
totalTimeB = double(timeB);
xlim([0 totalTimeB+T]);
xlabel('Time elapsed (s)');
ylabel('Velocity (m/s)');
legend;
hold off;