clear
clc
close all

% Graphing Conditions
domainMin = -10;
domainMax = 10;
domainInt = 0.25;
domain = domainMin:domainInt:domainMax;
[xx,yy] = meshgrid(domain,domain);
trajectoryMin = 0;
trajectoryMax = 1;
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

% Graph
figure_main = figure('Name','Trajectory','OuterPosition',[10 195 600 350]);
view(3);
surf(xx,yy,L(xx,yy),'DisplayName','Surface Topology','FaceAlpha',0.8);
hold on;
fplot3(xt,yt,zt,[trajectoryMin trajectoryMax],'DisplayName','Trajectory','lineWidth',1,'Color','black');
plot3(S(1),S(2),S(3),'Marker','o','DisplayName','Impact Point','Color','red');
for testTime = timeImpact:-minimumStep:0
    % Finding Sphere Coordinates
    locX = double(xt(testTime));
    locY = double(yt(testTime));
    locZ = double(zt(testTime));
    [X, Y, Z] = sphere(10);
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
            end
        end
    end
end
surf(X3, Y3, Z3,'DisplayName','Pod');
%plot3(X3,Y3,Z3,'Marker','x','DisplayName','Pod Impact Point','Color','red','HandleVisibility','off');
display(testTime);
xlim([domainMin domainMax]);
ylim([domainMin domainMax]);
zlim([domainMin domainMax]);
grid minor;
axis equal;
legend;
hold off;


