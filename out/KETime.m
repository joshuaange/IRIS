figure_KETime = figure('Name','Kinetic Energy-to-Time');
hold on;
timeC = 0;
StartingKE = 0.5*mass*(vec_mag(b{iit}.velocityStart))^2;
plot(0,StartingKE,'^','Color','blue','DisplayName',"Kinetic Energy A");
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        timeC = timeC + b{iit}.timeImpact;
        EndingKE = 0.5*mass*(vec_mag(b{iit}.velocityHit))^2;
        plot(timeC,EndingKE,'^','Color','blue','HandleVisibility','off');
        GroundKE = EndingKE;
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            timeC = timeC + T;
                GroundKE = GroundKE + s{iit,jit}.deltaKE;
                plot(timeC,GroundKE,'^','Color','blue','HandleVisibility','off');
        end;
    end;
end;
totalTimeC = double(timeC);
totalKE = double(GroundKE);
xlim([0 totalTimeC+T]);
xlabel('Time elapsed (s)');
ylabel('Kinetic Energy (J)');
legend;
hold off;
writematrix("Kinetic Energy: " + totalKE + " J",'Test Output','WriteMode','append');