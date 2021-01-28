domain = domainMin:domainInt:domainMax;

figure_main = figure('Name','Pod Motion','OuterPosition',[10 195 600 350])
view(3);
fsurf(L,'DisplayName','Surface Topology','FaceAlpha',0.8);

for iit = 1:i_max
    run(strcat(folder,'\out\main\trajectory.m'));
    for jit = 1:j_max
        run(strcat(folder,'\out\main\segment.m'));
    end
end

grid minor;
legend;
axis equal;
xlim([domainMin domainMax]);
ylim([domainMin domainMax]);
zlim([domainMin domainMax]);
hold off;