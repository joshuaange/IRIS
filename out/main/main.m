domain = domainMin:domainInt:domainMax;

figure_main = figure('Name','Pod Motion','OuterPosition',[10 195 600 350]);
fsurf(L,'DisplayName','Surface Topology','FaceAlpha',0.8);
hold on;

for iit = 1:i_max
    if isempty(b{iit}) == 0
        run(strcat(folder,'\out\main\trajectory.m'));
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            run(strcat(folder,'\out\main\segment.m'));
        end
    end
end

grid minor;
axis equal;
xlim([domainMin domainMax]);
ylim([domainMin domainMax]);
zlim([domainMin domainMax]);
view(3);
hold off;