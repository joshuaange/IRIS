function [xt, yt, zt, timeImpact, dxt, dyt, dzt, velocityHit] = II_main(velocityStart, airDensity, gravity, L)
% In-air calculations
%   Called by control.m
% Trajectory Functions
xt = @(t) velocityStart(2,1)*(airDensity/gravity)*(1-exp(-(gravity*t)/airDensity))+velocityStart(1,1);
yt = @(t) velocityStart(2,2)*(airDensity/gravity)*(1-exp(-(gravity*t)/airDensity))+velocityStart(1,2);
zt = @(t) (airDensity/gravity)*(velocityStart(2,3)+airDensity)*(1-exp(-(gravity*t)/airDensity))-(airDensity*t)+velocityStart(1,3);

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

