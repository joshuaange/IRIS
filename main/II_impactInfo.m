function [dxt, dyt, dzt, velocityHit, S, quatV_ground, quatA_ground] = II_impactInfo(x_limit, y_limit, C, xt, yt, zt, quatV_air, quatA_air, timeImpact, X, Y, Z, L, minimumEqual)
% Impact information
%   Called by control.m
% Differential of trajectory functions
syms t
dxt = matlabFunction(diff(xt(t)));
dyt = matlabFunction(diff(yt(t)));
dzt = matlabFunction(diff(zt(t)));
% Velocity of impact
velocityHit = [C(1) C(2) C(3) ; dxt(timeImpact) dyt(timeImpact) dzt(timeImpact)];
% Finds Average of Impact Points
totalX = 0;
totalY = 0;
totalZ = 0;
count = 0;
% Cycles through the points to average impact points
for dimOne = 1:x_limit
    for dimTwo = 1:y_limit
        if abs(L(X(dimOne,dimTwo),Y(dimOne,dimTwo))-Z(dimOne,dimTwo))<minimumEqual
            plot3(X(dimOne,dimTwo),Y(dimOne,dimTwo),Z(dimOne,dimTwo),'Marker','x','DisplayName','Numbered Impact Point','Color','red','HandleVisibility','off');
            count = count + 1;
            totalX = totalX + X(dimOne,dimTwo);
            totalY = totalY + Y(dimOne,dimTwo);
            totalZ = totalZ + Z(dimOne,dimTwo);
        end
    end
end
% Impact Point
S = [totalX/count totalY/count totalZ/count];
% Spin
quatV_ground = [S(1) S(2) S(3); quatV_air(2,1) quatV_air(2,2) quatV_air(2,3)];
quatA_ground = quatA_air;
end


