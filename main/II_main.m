function [xt, yt, zt, timeImpact, dxt, dyt, dzt, velocityHit, S, quatV_ground, quatA_ground] = II_main(velocityStart, terminalVelocity, gravity, L, minimumIgnore, podSpringConstant, diameter, quatV_air, quatA_air)
% In-air calculations
%   Called by control.m
% Trajectory Functions
syms t real
xt = @(t) velocityStart(2,1)*(terminalVelocity/gravity)*(1-exp((-(gravity*t)/terminalVelocity)))+velocityStart(1,1);
yt = @(t) velocityStart(2,2)*(terminalVelocity/gravity)*(1-exp((-(gravity*t)/terminalVelocity)))+velocityStart(1,2);
zt = @(t) (terminalVelocity/gravity)*(velocityStart(2,3)+terminalVelocity)*(1-exp((-(gravity*t)/terminalVelocity)))-(terminalVelocity*t)+velocityStart(1,3);

% Time of impact
syms t
timeImpact = vpasolve(L(xt(t),yt(t)) == zt(t), t, [minimumIgnore, Inf]);
if isempty(timeImpact) == 1
    writematrix("ERROR : timeImpact is zero",'Test Output','WriteMode','append');
end;

% Differential of trajectory functions
dxt = matlabFunction(diff(xt(t)));
dyt = matlabFunction(diff(yt(t)));
dzt = matlabFunction(diff(zt(t)));
% Velocity of impact
velocityHit = [xt(timeImpact) yt(timeImpact) zt(timeImpact) ; dxt(timeImpact) dyt(timeImpact) dzt(timeImpact)];
% Point of impact
S = [xt(timeImpact) yt(timeImpact) zt(timeImpact)];

% Spin
quatV_ground = [S(1) S(2) S(3); quatV_air(2,1) quatV_air(2,2) quatV_air(2,3)];
quatA_ground = quatA_air;
end

