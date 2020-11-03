function [timeImpact, X, Y, Z, C, x_limit, y_limit, XSphere, YSphere, ZSphere] = II_podCollision(L, diameter, xt, yt, zt, timeImpactFinal, minimumStep, minimumEqual)
% Shaped collision
%   Called by control.m
% Collision cycle from final impact moment to 0
% Define basic sphere
[XSphere, YSphere, ZSphere] = sphere;
X = XSphere*(diameter/2);
Y = YSphere*(diameter/2);
Z = ZSphere*(diameter/2);
C = [0 0 0];
% What are the limits of the vertice matrixes?
x_limit = size(XSphere,1);
y_limit = size(XSphere,2);
for timeTest = timeImpactFinal:-minimumStep:0
    % Forming sphere
    XMoved = XSphere*(diameter/2) + double(xt(timeTest));
    YMoved = YSphere*(diameter/2) + double(yt(timeTest));
    ZMoved = ZSphere*(diameter/2) + double(zt(timeTest));
    % Cycles through the points to find which is the latest collision
    for dimOne = 1:x_limit
        for dimTwo = 1:y_limit
            if abs(L(XMoved(dimOne,dimTwo),YMoved(dimOne,dimTwo))-ZMoved(dimOne,dimTwo))<minimumEqual
                % Center
                C = [double(xt(timeTest)) double(yt(timeTest)) double(zt(timeTest))];
                X = XSphere*(diameter/2) + C(1);
                Y = YSphere*(diameter/2) + C(2);
                Z = ZSphere*(diameter/2) + C(3);
                timeImpact = timeTest;
            end
        end
    end
end
end



