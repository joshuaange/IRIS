function [xt, yt, zt, timeImpactFinal] = II_trajectory(velocityStart, terminalVelocity, gravity, L, minimumIgnore)
% Trajectory and final time of impact
%   Called by control.m
% Trajectory Functions
syms t
xt = @(t) ((velocityStart(2,1)*terminalVelocity)/gravity)*(1-exp(-(gravity*t)/terminalVelocity))+velocityStart(1,1);
yt = @(t) ((velocityStart(2,2)*terminalVelocity)/gravity)*(1-exp(-(gravity*t)/terminalVelocity))+velocityStart(1,2);
zt = @(t) (terminalVelocity/gravity)*(velocityStart(2,3)+terminalVelocity)*(1-exp(-(gravity*t)/terminalVelocity))-(terminalVelocity*t)+velocityStart(1,3);
% xt = @(t) (((terminalVelocity)^2)/gravity)*log(((terminalVelocity^2)+gravity*velocityStart(2,1)*t)/(terminalVelocity^2))+velocityStart(1,1);
% yt = @(t) (((terminalVelocity)^2)/gravity)*log(((terminalVelocity^2)+gravity*velocityStart(2,2)*t)/(terminalVelocity^2))+velocityStart(1,2);
% zt = @(t) (((terminalVelocity)^2)/(2*gravity))*log((((velocityStart(2,3))^2)+(terminalVelocity^2))/(((terminalVelocity*((velocityStart(2,3)-terminalVelocity*tan((t*gravity)/terminalVelocity))/(terminalVelocity+velocityStart(2,3)*tan((t*gravity)/terminalVelocity))))^2)+(terminalVelocity^2)))+velocityStart(1,3);

% Time of impact
syms t
timeImpactFinal = vpasolve(L(xt(t),yt(t)) == zt(t), t, [minimumIgnore, Inf]);
if isempty(timeImpactFinal) == 1
    writematrix("ERROR : timeImpact is zero",'Test Output','WriteMode','append');
end
end

