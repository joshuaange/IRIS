clear
clc
close all

% Variables iit and jit iterate for in-air trajectories and 
% on-ground time segments respectively.  The following variables 
% set the maximum limits of their for loops.  If jitMax is too 
% low (meaning it registers as still continuing along the 
% ground), the result will be an error.
iitMax = 3;
jitMax = 2;
% Acceptable range of velocity to be considered 0
stopRange = 1;
% Limits of surface mesh minimum, maximum, and interval
domainMin = -10;
domainMax = 10;
domainInt = 0.33;
% Limits (time) of trajectory display
trajectoryMin = 0;
trajectoryMax = 2;
% Minimum ignore condition for timeImpact
minimumIgnore = 0.0000000000000000000000000000001;

% Terrain (Surface Topology)
L = @(x,y) 0*x + 0*y + 0;
% Terrain (Spring Constant)
K = @(x,y) 0*x + 0*y + 15;
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
T = 0.016;
diameter = 0.0627;
podYoungsMod = 265126210;
podModRigidity = 219238980;

% Initial Conditions
velocityStart = [0 0 1; 2.7 0.0001 0];

run('control.m')