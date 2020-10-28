function [X_new, Y_new, Z_new, C_new, x_limit, y_limit, vec_OM, S_new, vec_N_new, X_newFinal, Y_newFinal, Z_newFinal, vec_M] = III_pod(C, vec_O, XSphere, YSphere, ZSphere, diameter, dLdx, dLdy, L, minimumEqual)
% Pod equations
%   Called by control.m
% New working impact point
vec_OM = [C(1) C(2) C(3); vec_O(2,1) vec_O(2,2) vec_O(2,3)];
% New Working Impact Point
X_new = XSphere*(diameter/2) + vec_OM(1,1)+vec_OM(2,1);
Y_new = YSphere*(diameter/2) + vec_OM(1,2)+vec_OM(2,2);
Z_new = ZSphere*(diameter/2) + vec_OM(1,3)+vec_OM(2,3);
totalX_new = 0;
totalY_new = 0;
totalZ_new = 0;
count_new = 0;
x_limit = size(XSphere,1);
y_limit = size(XSphere,2);
for dimOne = 1:x_limit
    for dimTwo = 1:y_limit
        if abs(L(X_new(dimOne,dimTwo),Y_new(dimOne,dimTwo))-Z_new(dimOne,dimTwo))<minimumEqual
            plot3(X_new(dimOne,dimTwo),Y_new(dimOne,dimTwo),Z_new(dimOne,dimTwo),'Marker','x','DisplayName','New Numbered Impact Point','Color','red','HandleVisibility','off');
            count_new = count_new + 1;
            totalX_new = totalX_new + X_new(dimOne,dimTwo);
            totalY_new = totalY_new + Y_new(dimOne,dimTwo);
            totalZ_new = totalZ_new + Z_new(dimOne,dimTwo);
        end
    end
end
S_new = [totalX_new/count_new totalY_new/count_new totalZ_new/count_new];
% Find normal vector
dLdxS_new = dLdx(S_new(1),S_new(2));
dLdyS_new = dLdy(S_new(1),S_new(2));
vec_N_new = [S_new(1) S_new(2) S_new(3); -dLdxS_new -dLdyS_new 1];

% Finds new pod location (final)
X_newFinal = XSphere*(diameter/2) + S_new(1) + (diameter/2)*cos(vec_alpha(vec_N_new));
Y_newFinal = YSphere*(diameter/2) + S_new(2) + (diameter/2)*cos(vec_beta(vec_N_new));
Z_newFinal = ZSphere*(diameter/2) + S_new(3) + (diameter/2)*cos(vec_gamma(vec_N_new));
vec_M = [C(1) C(2) C(3); S_new(1)+(diameter/2)*cos(vec_alpha(vec_N_new))-C(1) S_new(2)+(diameter/2)*cos(vec_beta(vec_N_new))-C(2) S_new(3)+(diameter/2)*cos(vec_gamma(vec_N_new))-C(3)];
C_new = [vec_M(1,1)+vec_M(2,1), vec_M(1,2)+vec_M(2,2), vec_M(1,3)+vec_M(2,3)];
end

