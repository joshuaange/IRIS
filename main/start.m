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
domainMin = -30;
domainMax = 30;
domainInt = 1;
% Limits (time) of trajectory display
trajectoryMin = 0;
trajectoryMax = 15;
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
L = @(x,y) 0.0000000000000000000000000000000001*x+0.0000000000000000000000000000000001*y;
% Terrain (Spring Constant of Pod With Ground) (N/m2)
K = @(x,y) 0*x + 0*y + 150;
% Terrain (Proportion of Time of Coefficient of Restitution)
KT = @(x,y) 0*x + 0*y + 1;
% Terrain (Frictional Coefficient)
F = @(x,y) 0*x + 0*y + 0.6;
% Terrain (Proportion of Rolling Friction)
R = @(x,y) 0*x + 0*y + 0;
% Terrain (Young's Modulus) (gf/mm2) = N/m2 / (98.066501*100)
YM = @(x,y) 0*x + 0*y + (7.5e+10)/ (98.066501*100);
% Terrain (Modulus of Rigidity) (gf/mm2) = N/m2 / (98.066501*100)
G = @(x,y) 0*x + 0*y + (2.1e+10)/ (98.066501*100);

% General
mass = 0.14;
gravity = 9.81;
airDensity = 1.2;
dragCoefficient = 0.5;
T = 1;
diameter = 0.075;
podYoungsMod = (1.75e+9)/ (98.066501*100); % (gf/mm2) = N/m2 / (98.066501*100)
podModRigidity = (3e+9)/ (98.066501*100); % (gf/mm2) = N/m2 / (98.066501*100)
momentOfInertia = mass*(diameter/2)^2;
HeatPercentage = 1;

% Initial Conditions
velocityStart = [0 0 1.5; 2.7 0 0];
quatV_air = [velocityStart(1,1) velocityStart(1,2) velocityStart(1,3); 0.14 -0.87 0.48];
quatA_air = -0.349066;

% Initial pod temperature, to be changed with each on-ground iteration (K)
TP = 300;
% Heat capacity (J/K)
heatCapacity = 204;
% Temperature of ground (K)
TE = @(x,y) 0*x + 0*y + 400;
% Thermal conductivity between pod and ground (W/(m⋅K))
TC = @(x,y) 0*x + 0*y + 17;
% Thermal conductivity between pod and atmosphere (W/(m⋅K))
TCT = @(x,y) 0*x + 0*y + 20;

run('control.m')