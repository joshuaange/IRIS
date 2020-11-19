figure_posTime = figure('Name','Reactions-to-Time');
hold on;
timeA = 0;
plot(0,0,'o','Color','green','DisplayName',"velocity_{Hit}");
plot(0,0,'^','Color','black','DisplayName',"vec_{rotVelocity}");
plot(0,0,'^','Color','green','DisplayName',"vec_{VR}");
plot(0,0,'s','Color','blue','DisplayName',"vec_{VF}");
plot(0,0,'s','Color','green','DisplayName',"vec_{VG}");
plot(0,0,'^','Color','red','DisplayName',"vec_{VE}");
plot(0,0,'o','Color','red','DisplayName',"velocity_{End}");
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        timeA = timeA + b{iit}.timeImpact;
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
            plot(timeA,vec_mag(s{iit,jit}.velocityHit),'o','Color','green','HandleVisibility','off');
            plot(timeA,vec_mag(s{iit,jit}.vec_rotVelocity),'^','Color','black','HandleVisibility','off');
            plot(timeA,vec_mag(s{iit,jit}.vec_VR),'^','Color','green','HandleVisibility','off');
            plot(timeA,vec_mag(s{iit,jit}.vec_VF),'s','Color','blue','HandleVisibility','off');
            plot(timeA,vec_mag(s{iit,jit}.vec_VG),'s','Color','green','HandleVisibility','off');
            plot(timeA,vec_mag(s{iit,jit}.vec_VE),'^','Color','red','HandleVisibility','off');
            plot(timeA,vec_mag(s{iit,jit}.velocityEnd),'o','Color','red','HandleVisibility','off');
        end;
    end;
end;
totalTimeA = double(timeA);
xlim([0 totalTimeA+T]);
xlabel('Time elapsed (s)');
ylabel('Strength (m/s)');
legend;
hold off;
writematrix("Time Elapsed: " + totalTimeA + "s",'Test Output','WriteMode','append');