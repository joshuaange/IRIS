% Potential Energy only good for flat surfaces
figure_KETime = figure('Name','Gravitational Energy-to-Time');
hold on;
timeA = 0;
plot(0,StartingKE,'d','Color','blue','DisplayName',"Kinetic Energy");
plot(0,StartingKE,'s','Color','red','DisplayName',"Potential Energy");
plot(0,StartingKE,'s','Color','black','DisplayName',"Total Energy");
plot(0,0,'o','Color','green','DisplayName',"Total Energy Lost",'MarkerFaceColor','green');
for iit = 1:iitMax
    if isempty(b{iit}) == 0
        for iteration = 1:floor(b{iit}.timeImpact/T)
            multitude = iteration*(T);
            plot(timeA+multitude,(0.5*(vec_mag([b{iit}.xt(multitude) b{iit}.yt(multitude) b{iit}.zt(multitude); b{iit}.dxt(multitude) b{iit}.dyt(multitude) b{iit}.dzt(multitude)]))^2),'d','Color','blue','HandleVisibility','off');
            plot(timeA+multitude,gravity*(b{iit}.zt(multitude)-L(b{iit}.xt(multitude),b{iit}.yt(multitude))),'s','Color','red','HandleVisibility','off');
            plot(timeA+multitude,(0.5*(vec_mag([b{iit}.xt(multitude) b{iit}.yt(multitude) b{iit}.zt(multitude); b{iit}.dxt(multitude) b{iit}.dyt(multitude) b{iit}.dzt(multitude)]))^2)+gravity*(b{iit}.zt(multitude)-L(b{iit}.xt(multitude),b{iit}.yt(multitude))),'s','Color','black','HandleVisibility','off');
        end;
        timeA = timeA + b{iit}.timeImpact;
        plot(timeA,b{iit}.EndingKE,'d','Color','blue','HandleVisibility','off');
        plot(timeA,0,'s','Color','red','HandleVisibility','off');
        plot(timeA,b{iit}.EndingKE,'s','Color','black','HandleVisibility','off','MarkerFaceColor','black');
        plot(timeA,b{iit}.LostKE,'o','Color','green','HandleVisibility','off','MarkerFaceColor','green');
    end;
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            timeA = timeA + T;
                plot(timeA,s{iit,jit}.EndingKE,'d','Color','blue','HandleVisibility','off','MarkerFaceColor','blue');
                plot(timeA,0,'s','Color','red','HandleVisibility','off');
                plot(timeA,s{iit,jit}.EndingKE,'s','Color','black','HandleVisibility','off');
                plot(timeA,s{iit,jit}.LostKE,'o','Color','green','HandleVisibility','off','MarkerFaceColor','green');
                totalKE = double(s{iit,jit}.EndingKE);
        end;
    end;
end;
totalTimeA = double(timeA);
xlim([(double(b{1}.timeImpact)) (totalTimeA+T)]);
xlabel('Time elapsed (s)');
ylabel('Energy/Mass (J/kg)');
legend;
hold off;
writematrix("Kinetic Energy: " + totalKE + " J",'Test Output','WriteMode','append');