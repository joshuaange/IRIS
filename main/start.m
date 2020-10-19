clear
clc
close all

% Variables iit and jit iterate for in-air trajectories and 
% on-ground time segments respectively.  The following variables 
% set the maximum limits of their for loops.  If jitMax is too 
% low (meaning it registers as still continuing along the 
% ground), the result will be an error.
iitMax = 2;
jitMax = 20;
% Acceptable range of velocity to be considered 0
stopRange = 0.1;
% Limits of surface mesh minimum, maximum, and interval
domainMin = -10;
domainMax = 10;
domainInt = 0.33;
% Limits (time) of trajectory display
trajectoryMin = 0;
trajectoryMax = 1;
% Minimum ignore condition for timeImpact
minimumIgnore = 0.0000000000000000000000000001;
% Minimum ignore condition for coefficient of restitution
minimumRestitution = 0.4/50;

% Terrain (Surface Topology)
L = @(x,y) 0*x + 0*y + 0;
% Terrain (Coefficient of Restitution)
K = @(x,y) 0*x + 0*y + 0;
% Terrain (Proportion of Friction)
F = @(x,y) 0*x + 0*y + 0;
% Terrain (Proportion of Rolling Friction)
R = @(x,y) 0*x + 0*y + 0;
% Terrain (Young's Modulus)
Y = @(x,y) 0*x + 0*y + 4180836470;
% Terrain (Modulus of Rigidity)
G = @(x,y) 0*x + 0*y + 2141404040;

% General
mass = 0.14;
gravity = 9.81;
airDensity = 1.2;
surfaceArea = 0.012;
dragCoefficient = 0.5;
T = 0.1;
diameter = 0.0627;
podYoungsMod = 265126210;
podModRigidity = 219238980;
podSpringConstant = 15; %(Some Elasticity Factor)

% Initial Conditions
velocityStart = [0 0 1; 2.7 0.0001 0];

% Initial pod temperature, to be changed with each on-ground iteration
TP = 100;
% Heat capacity
heatCapacity = 200;
% Temperature of ground
TE = @(x,y) 0*x + 0*y + 40;
% Thermal conductivity between pod and ground
TC = @(x,y) 0*x + 0*y + 5000000;

run('control.m')