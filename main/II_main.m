function [xt, yt, zt, timeImpact, dxt, dyt, dzt, velocityHit] = II_main(velocityStart, terminalVelocity, gravity, L)
% In-air calculations
%   Called by control.m
% Trajectory Functions
xt = @(t) velocityStart(2,1)*(terminalVelocity/gravity)*(1-exp(-(gravity*t)/terminalVelocity))+velocityStart(1,1);
yt = @(t) velocityStart(2,2)*(terminalVelocity/gravity)*(1-exp(-(gravity*t)/terminalVelocity))+velocityStart(1,2);
zt = @(t) (terminalVelocity/gravity)*(velocityStart(2,3)+terminalVelocity)*(1-exp(-(gravity*t)/terminalVelocity))-(terminalVelocity*t)+velocityStart(1,3);

% Time of impact
syms t
timeImpact = vpasolve(L(xt(t),yt(t)) == zt(t), t, [0, Inf]);

% Differential of trajectory functions
dxt = matlabFunction(diff(xt(t)));
dyt = matlabFunction(diff(yt(t)));
dzt = matlabFunction(diff(zt(t)));
% Velocity of impact
velocityHit = [xt(timeImpact) yt(timeImpact) zt(timeImpact) ; dxt(timeImpact) dyt(timeImpact) dzt(timeImpact)];
end

