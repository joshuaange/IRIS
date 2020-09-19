clear
clc
close all
syms x y t M Ret
% The initial velocity must not have 0 motion in the x and y axes
% Return in-air must occur before iitmax is reached

nitmax = 10;
iitmax = 10;
stop_interval = 3;

% Graphing
domainmin = -10;
domainmax = 10;
domainint = 0.33;
trajectorylengthmin = -1;
trajectorylengthmax = 10;

% General
m = 1;
g = 1;
rho = 1;
A = 0.1;
C_d = 1;
T = 1;
D = 1;
Y_p = 1;
G_p = 1;

% Terrain Functions
L = @(x,y) x.*(cos(x)+cos(y));
K = @(x,y) 0*x + 0*y + 0.3;
F = @(x,y) 0*x + 0*y + 0;
R = @(x,y) 0*x + 0*y + 1;
Y = @(x,y) 0*x + 0*y + 1;
G = @(x,y) 0*x + 0*y + 1;

% Initial Conditions
v_V = [-5 0 10; 2 2 0];

% run('control.m')
run('simple_control.m')