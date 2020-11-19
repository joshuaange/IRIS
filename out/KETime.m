% Potential Energy only good for flat surfaces
figure_KETime = figure('Name','Gravitational Energy-to-Time');
hold on;
timeA = 0;
StartingKE = 0.5*mass*(vec_mag(b{iit}.velocityStart))^2;
plot(0,StartingKE,'d','Color','blue','DisplayName',"Kinetic Energy");
plot(0,StartingKE,'s','Color','red','DisplayName',"Potential Energy");
plot(0,StartingKE,'s','Color','black','DisplayName',"Total Energy");
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        for iteration = 1:floor(b{iit}.timeImpact/T)
            multitude = iteration*(T);
            plot(timeA+multitude,(0.5*(vec_mag([b{iit}.xt(multitude) b{iit}.yt(multitude) b{iit}.zt(multitude); b{iit}.dxt(multitude) b{iit}.dyt(multitude) b{iit}.dzt(multitude)]))^2),'d','Color','blue','HandleVisibility','off');
            plot(timeA+multitude,gravity*(b{iit}.zt(multitude)-L(b{iit}.xt(multitude),b{iit}.yt(multitude))),'s','Color','red','HandleVisibility','off');
            plot(timeA+multitude,(0.5*(vec_mag([b{iit}.xt(multitude) b{iit}.yt(multitude) b{iit}.zt(multitude); b{iit}.dxt(multitude) b{iit}.dyt(multitude) b{iit}.dzt(multitude)]))^2)+gravity*(b{iit}.zt(multitude)-L(b{iit}.xt(multitude),b{iit}.yt(multitude))),'s','Color','black','HandleVisibility','off');
        end;
        timeA = timeA + b{iit}.timeImpact;
        EndingKE = 0.5*(vec_mag(b{iit}.velocityHit))^2;
        plot(timeA,EndingKE,'d','Color','blue','HandleVisibility','off');
        plot(timeA,0,'s','Color','red','HandleVisibility','off');
        plot(timeA,EndingKE,'s','Color','black','HandleVisibility','off');
        GroundKE = EndingKE;
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
                GroundKE = GroundKE + s{iit,jit}.deltaKE;
                plot(timeA,GroundKE,'d','Color','blue','HandleVisibility','off');
                plot(timeA,0,'s','Color','red','HandleVisibility','off');
                plot(timeA,GroundKE,'s','Color','black','HandleVisibility','off');
        end;
    end;
end;
totalTimeA = double(timeA);
totalKE = double(GroundKE);
xlim([(double(b{1}.timeImpact)) (totalTimeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Energy/Mass (J/kg)');
legend;
hold off;
writematrix("Kinetic Energy: " + totalKE + " J",'Test Output','WriteMode','append');