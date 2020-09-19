% Some general notes:
%     vec_AA refers to vector "AA"
%       vec_AA = [x, y, z; u, v, w]
%     quat_BB refers to quaternion "BB"
%       quat_BB = quaternion(A,B,C,D)

clear
clc
close all

% Variables iit and jit iterate for in-air trajectories and 
% on-ground time segments respectively.  The following variables 
% set the maximum limits of their for loops.  If jitMax is too 
% low (meaning it registers as still continuing along the 
% ground), the result will be an error.
iitMax = 10;
jitMax = 10;
% Acceptable range of velocity to be considered 0
stopRange = 0;
% Limits of surface mesh minimum, maximum, and interval
domainMin = -10;
domainMax = 10;
domainInt = 0.33;
% Limits (time) of trajectory display
trajectoryMin = -1;
trajectoryMax = 10;

% Terrain (Surface Topology)
L = @(x,y) 0*x + 0*y;
% Terrain (Spring Constant)
K = @(x,y) 0*x + 0*y;
% Terrain (Proportion of Friction)
F = @(x,y) 0*x + 0*y;
% Terrain (Proportion of Rolling Friction)
R = @(x,y) 0*x + 0*y;
% Terrain (Young's Modulus)
Y = @(x,y) 0*x + 0*y;
% Terrain (Modulus of Rigidity)
G = @(x,y) 0*x + 0*y;

% General
mass = 1;
gravity = 1;
airDensity = 1;
surfaceArea = 0.1;
dragCoefficient = 1;
timeSegmentLength = 1;
diameter = 1;
podYoungsMod = 1;
podModRigidity = 1;
% Initial Conditions
velocityStart = [0 0 0; 0 0 0];

run('control.m')