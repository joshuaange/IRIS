clear
clc
close all

% Graphing Conditions
domainMin = -1.5;
domainMax = 6;
domainInt = 0.25;
domain = domainMin:domainInt:domainMax;
[xx,yy] = meshgrid(domain,domain);
trajectoryMin = 0;
trajectoryMax = 0.5;
minimumStep = 0.01;
minimumEqual = 0.008;

% Trajectory
gravity = 10;
diameter = 1;
mass = 0.14;
airDensity = 1.2;
surfaceArea = 0.012;
dragCoefficient = 0.5;
terminalVelocity = sqrt((2*mass*gravity)/(airDensity*surfaceArea*dragCoefficient));
velocityStart = [-1.4 0 1; 8 0.00001 0];
syms t real
xt = @(t) velocityStart(2,1)*(terminalVelocity/gravity)*(1-exp((-(gravity*t)/terminalVelocity)))+velocityStart(1,1);
yt = @(t) velocityStart(2,2)*(terminalVelocity/gravity)*(1-exp((-(gravity*t)/terminalVelocity)))+velocityStart(1,2);
zt = @(t) (terminalVelocity/gravity)*(velocityStart(2,3)+terminalVelocity)*(1-exp((-(gravity*t)/terminalVelocity)))-(terminalVelocity*t)+velocityStart(1,3);
% Surface
L = @(x,y) 1*(sin(x)) + 0.25*(sin(y)) - 1;
% Basic Collision
syms t
timeImpact = vpasolve(L(xt(t),yt(t)) == zt(t), t, [0, Inf]);
S = [xt(timeImpact) yt(timeImpact) zt(timeImpact)];

% Pre
syms x y
dLdx = matlabFunction(diff(L,x),'Vars',[x y]);
dLdy = matlabFunction(diff(L,y),'Vars',[x y]);

% Graph
figure_main = figure('Name','Trajectory','OuterPosition',[10 195 600 350]);
view(3);
surf(xx,yy,L(xx,yy),'DisplayName','Surface Topology','FaceAlpha',0.8);
hold on;
fplot3(xt,yt,zt,[trajectoryMin trajectoryMax],'DisplayName','Trajectory','lineWidth',1,'Color','black');
plot3(S(1),S(2),S(3),'Marker','s','DisplayName','Time Impact Point','Color','red');

% Finds collision
for testTime = timeImpact:-minimumStep:0
    % Finding Sphere Coordinates
    locX = double(xt(testTime));
    locY = double(yt(testTime));
    locZ = double(zt(testTime));
    [X, Y, Z] = sphere;
    X2 = X*(diameter/2) + locX;
    Y2 = Y*(diameter/2) + locY;
    Z2 = Z*(diameter/2) + locZ;
    % Is colliding?
    x_limit = size(X2,1);
    y_limit = size(X2,2);
    for dimOne = 1:x_limit
        for dimTwo = 1:y_limit
            if abs(L(X2(dimOne,dimTwo),Y2(dimOne,dimTwo))-Z2(dimOne,dimTwo))<minimumEqual
                X3 = X*(diameter/2) + locX;
                Y3 = Y*(diameter/2) + locY;
                Z3 = Z*(diameter/2) + locZ;
                C = [locX locY locZ];
            end
        end
    end
end
surf(X3, Y3, Z3,'DisplayName','Pod','facealpha',0.2,'edgealpha',0.1);
plot3(C(1),C(2),C(3),'Marker','o','DisplayName','Center Impact Point','Color','red');

% Finds new working Impact Point
totalX = 0;
totalY = 0;
totalZ = 0;
count = 0;
for dimOne = 1:x_limit
    for dimTwo = 1:y_limit
        if abs(L(X3(dimOne,dimTwo),Y3(dimOne,dimTwo))-Z3(dimOne,dimTwo))<minimumEqual
            plot3(X3(dimOne,dimTwo),Y3(dimOne,dimTwo),Z3(dimOne,dimTwo),'Marker','x','DisplayName','Numbered Impact Point','Color','red','HandleVisibility','off');
            count = count + 1;
            totalX = totalX + X3(dimOne,dimTwo);
            totalY = totalY + Y3(dimOne,dimTwo);
            totalZ = totalZ + Z3(dimOne,dimTwo);
        end
    end
end
S = [totalX/count totalY/count totalZ/count];
plot3(S(1), S(2), S(3),'Marker','o','DisplayName','Impact Point','Color','cyan');
% Movement of new working impact point
vec_O = [S(1) S(2) S(3); 1 -0.75 L(S(1)+1,S(2)-0.75)];
quiver3(vec_O(1,1),vec_O(1,2),vec_O(1,3),vec_O(2,1),vec_O(2,2),vec_O(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.5,'DisplayName','Traced Segment Vector');
vec_OM = [C(1) C(2) C(3); vec_O(2,1) vec_O(2,2) vec_O(2,3)];
quiver3(vec_OM(1,1),vec_OM(1,2),vec_OM(1,3),vec_OM(2,1),vec_OM(2,2),vec_OM(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.5,'DisplayName','Center Movement Segment Vector','LineStyle','--');
% Finds New Working Impact Point
X4 = X*(diameter/2) + vec_OM(1,1)+vec_OM(2,1);
Y4 = Y*(diameter/2) + vec_OM(1,2)+vec_OM(2,2);
Z4 = Z*(diameter/2) + vec_OM(1,3)+vec_OM(2,3);
totalX = 0;
totalY = 0;
totalZ = 0;
count = 0;
for dimOne = 1:x_limit
    for dimTwo = 1:y_limit
        if abs(L(X4(dimOne,dimTwo),Y4(dimOne,dimTwo))-Z4(dimOne,dimTwo))<minimumEqual
            plot3(X4(dimOne,dimTwo),Y4(dimOne,dimTwo),Z4(dimOne,dimTwo),'Marker','x','DisplayName','New Numbered Impact Point','Color','red','HandleVisibility','off');
            count = count + 1;
            totalX = totalX + X4(dimOne,dimTwo);
            totalY = totalY + Y4(dimOne,dimTwo);
            totalZ = totalZ + Z4(dimOne,dimTwo);
        end
    end
end
S_new = [totalX/count totalY/count totalZ/count];
plot3(S_new(1), S_new(2), S_new(3),'Marker','o','DisplayName','New Impact Point','Color','cyan');
surf(X4, Y4, Z4,'DisplayName','Working Pod','facealpha',0.5,'edgealpha',0.2);
% Find normal vector
dLdxS_new = dLdx(S_new(1),S_new(2));
dLdyS_new = dLdy(S_new(1),S_new(2));
vec_N_new = [S_new(1) S_new(2) S_new(3); -dLdxS_new -dLdyS_new 1];
quiver3(vec_N_new(1,1),vec_N_new(1,2),vec_N_new(1,3),vec_N_new(2,1),vec_N_new(2,2),vec_N_new(2,3),'lineWidth',1,'Color','cyan','MaxHeadSize',0.5,'DisplayName','Normal Vector (Impact)','LineStyle','--');

% Finds new pod location (final)
X5 = X*(diameter/2) + S_new(1) + (diameter/2)*cos(vec_alpha(vec_N_new));
Y5 = Y*(diameter/2) + S_new(2) + (diameter/2)*cos(vec_beta(vec_N_new));
Z5 = Z*(diameter/2) + S_new(3) + (diameter/2)*cos(vec_gamma(vec_N_new));
surf(X5, Y5, Z5,'DisplayName','New Pod','facealpha',0.75,'edgealpha',0.3);
vec_M = [C(1) C(2) C(3); S_new(1)+(diameter/2)*cos(vec_alpha(vec_N_new))-C(1) S_new(2)+(diameter/2)*cos(vec_beta(vec_N_new))-C(2) S_new(3)+(diameter/2)*cos(vec_gamma(vec_N_new))-C(3)];
quiver3(vec_M(1,1),vec_M(1,2),vec_M(1,3),vec_M(2,1),vec_M(2,2),vec_M(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Movement Vector');
plot3(vec_M(1,1)+vec_M(2,1),vec_M(1,2)+vec_M(2,2),vec_M(1,3)+vec_M(2,3),'Marker','*','DisplayName','New Center Point','Color','red');

display(testTime);
xlim([domainMin domainMax]);
ylim([domainMin domainMax]);
zlim([domainMin domainMax]);
grid minor;
axis equal;
legend;
hold off;


