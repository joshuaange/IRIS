clear
clc
close all

% Variables iit and jit iterate for in-air trajectories and 
% on-ground time segments respectively.  The following variables 
% set the maximum limits of their for loops.  If jitMax is too 
% low (meaning it registers as still continuing along the 
% ground), the result will be an error.
iitMax = 1;
jitMax = 1;
% Acceptable range of velocity to be considered 0 and stop
stopRange = 0.05;
% Limits of surface mesh minimum, maximum, and interval
domainMin = -20;
domainMax = 20;
domainInt = 1;
% Limits (time) of trajectory display
trajectoryMin = 0;
trajectoryMax = 2;
% Minimum ignore condition for timeImpact (timeImpact can't be below)
minimumIgnore = 0.05;
% Minimum ignore condition for next iteration (velocity gap must be over)
minimumIgnoreIteration = 0.6;
% Minimum ignore condition for coefficient of restitution (set to 0)
minimumRestitution = 0.4/50;
% Minimum flatness for gravity to be pointed only downward
minimumFlatness = 0.000001;
% Finding pod collision
minimumStep = 0.01;
minimumEqual = 0.008;

% Terrain (Surface Topology)
L = @(x,y) 0.000000000000000000000000000000000001*x+0.000000000000000000000000000000000001*y;
% Terrain (Coefficient of Restitution)
K = @(x,y) 0*x + 0*y + 5/7;
% Terrain (Proportion of Time of Coefficient of Restitution)
KT = @(x,y) 0*x + 0*y + 1;
% Terrain (Proportion of Friction)
F = @(x,y) 0*x + 0*y + 0;
% Terrain (Proportion of Rolling Friction)
R = @(x,y) 0*x + 0*y + 0;
% Terrain (Young's Modulus)
YM = @(x,y) 0*x + 0*y + 4180836470;
% Terrain (Modulus of Rigidity)
G = @(x,y) 0*x + 0*y + 2141404040;

% General
mass = 0.14;
gravity = 9.81;
airDensity = 1.2;
surfaceArea = 0.012;
dragCoefficient = 0.5;
T = 1/60;
diameter = 0.0627;
podYoungsMod = 265126210;
podModRigidity = 219238980;
podSpringConstant = 15; %(Some Elasticity Factor)
momentOfInertia = 0.00009173009999999997;

% Initial Conditions
velocityStart = [-5 -5 4; 2.4 0 -1.25];
quatV_air = [velocityStart(1,1) velocityStart(1,2) velocityStart(1,3); 0 0 0];
quatA_air = 0;

% Initial pod temperature, to be changed with each on-ground iteration
TP = 100;
% Heat capacity
heatCapacity = 200;
% Temperature of ground
TE = @(x,y) 0*x + 0*y + 40;
% Thermal conductivity between pod and ground
TC = @(x,y) 0*x + 0*y + 5000000;

run('control.m')