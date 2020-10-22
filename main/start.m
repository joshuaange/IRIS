clear
clc
close all

% Variables iit and jit iterate for in-air trajectories and 
% on-ground time segments respectively.  The following variables 
% set the maximum limits of their for loops.  If jitMax is too 
% low (meaning it registers as still continuing along the 
% ground), the result will be an error.
iitMax = 3;
jitMax = 25;
% Acceptable range of velocity to be considered 0
stopRange = 0.01;
% Limits of surface mesh minimum, maximum, and interval
domainMin = -10;
domainMax = 10;
domainInt = 0.25;
% Limits (time) of trajectory display
trajectoryMin = 0;
trajectoryMax = 5;
% Minimum ignore condition for timeImpact
minimumIgnore = 0.0000000000000000000000000001;
% Minimum ignore condition for coefficient of restitution
minimumRestitution = 0.4/50;

% Terrain (Surface Topology)
L = @(x,y) 1*(sin(x)) + 0.25*(sin(y)) - 1;
% Terrain (Coefficient of Restitution)
K = @(x,y) 0*x + 0*y + 0.5;
% Terrain (Proportion of Time of Coefficient of Restitution)
KT = @(x,y) 0*x + 0*y + 0.3;
% Terrain (Proportion of Friction)
F = @(x,y) 0*x + 0*y + 0.5;
% Terrain (Proportion of Rolling Friction)
R = @(x,y) 0*x + 0*y + 0.5;
% Terrain (Young's Modulus)
Y = @(x,y) 0*x + 0*y + 4180836470;
% Terrain (Modulus of Rigidity)
G = @(x,y) 0*x + 0*y + 2141404040;

% General
mass = 0.14;
gravity = 10;
airDensity = 1.2;
surfaceArea = 0.012;
dragCoefficient = 0.5;
T = 0.01;
diameter = 0.0627;
podYoungsMod = 265126210;
podModRigidity = 219238980;
podSpringConstant = 15; %(Some Elasticity Factor)
momentOfInertia = 0.00009173009999999997;

% Initial Conditions
velocityStart = [-1.4 0 1; 8 0.00001 0];
quatV_air = [velocityStart(1,1) velocityStart(1,2) velocityStart(1,3); 0 1 0];
quatA_air = 0.1;

% Initial pod temperature, to be changed with each on-ground iteration
TP = 100;
% Heat capacity
heatCapacity = 200;
% Temperature of ground
TE = @(x,y) 0*x + 0*y + 40;
% Thermal conductivity between pod and ground
TC = @(x,y) 0*x + 0*y + 5000000;

run('control.m')