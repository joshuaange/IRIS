clear
clc
close all
syms x y t M Ret
% The initial velocity must not have 0 motion in the x and y axes
% Return in-air must occur before iitmax is reached

nitmax = 25;
iitmax = 60;
stop_interval = 0.01;

% Graphing
domainmin = -10;
domainmax = 10;
domainint = 0.33;
trajectorylengthmin = -1;
trajectorylengthmax = 10;

% General
m = 0.14;
g = 9.81;
rho = 1.2;
A = 0.012;
C_d = 0.5;
T = 0.008;
D = 0.0627;
Y_p = 265126210;
G_p = 219238980;

% Terrain Functions
L = @(x,y) 0*x + 0*y + 0;
K = @(x,y) 0*x + 0*y + 15;
F = @(x,y) 0*x + 0*y + 0.1;
R = @(x,y) 0*x + 0*y + 0;
Y = @(x,y) 0*x + 0*y + 4180836470;
G = @(x,y) 0*x + 0*y + 2141404040;

% Initial Conditions
v_V = [0 0 1; 2.7 0.0001 0];

run('control.m')
% run('simple_control.m')