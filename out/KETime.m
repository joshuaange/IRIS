figure_KETime = figure('Name','Kinetic Energy-to-Time');
hold on;
timeA = 0;
StartingKE = 0.5*mass*(vec_mag(b{iit}.velocityStart))^2;
plot(0,StartingKE,'^','Color','blue','DisplayName',"Kinetic Energy A");
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        for iteration = 1:floor(b{iit}.timeImpact/T)
            multitude = iteration*(T);
            plot(timeA+multitude,(0.5*mass*(vec_mag([b{iit}.xt(multitude) b{iit}.yt(multitude) b{iit}.zt(multitude); b{iit}.dxt(multitude) b{iit}.dyt(multitude) b{iit}.dzt(multitude)]))^2),'^','Color','blue','HandleVisibility','off');
        end;
        timeA = timeA + b{iit}.timeImpact;
        EndingKE = 0.5*mass*(vec_mag(b{iit}.velocityHit))^2;
        plot(timeA,EndingKE,'^','Color','blue','HandleVisibility','off');
        GroundKE = EndingKE;
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
                GroundKE = GroundKE + s{iit,jit}.deltaKE;
                plot(timeA,GroundKE,'^','Color','blue','HandleVisibility','off');
        end;
    end;
end;
totalTimeA = double(timeA);
totalKE = double(GroundKE);
xlim([0 totalTimeA+T]);
xlabel('Time elapsed (s)');
ylabel('Kinetic Energy (J)');
legend;
hold off;
writematrix("Kinetic Energy: " + totalKE + " J",'Test Output','WriteMode','append');