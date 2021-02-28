function [Z] = L(X,Y)
% L Finds the interpolated value on the heightmap for input coordinates

global L_x L_y L_z L_domain bicubic_Interval
syms VAL

% Finding X Index
L_x_floor = find(L_x==floor(X/(L_domain/size(L_z,1))) * (L_domain/size(L_z,1)));
phi = vpasolve(L_x(L_x_floor) + (L_domain/size(L_z,1))*VAL == X,VAL);
L_x_phi = round(phi/bicubic_Interval) * bicubic_Interval;
% Finding Y Index
L_y_floor = find(L_y==floor(Y/(L_domain/size(L_z,2))) * (L_domain/size(L_z,2)));
phi = vpasolve(L_y(L_y_floor) + (L_domain/size(L_z,2))*VAL == Y,VAL);
L_y_phi = round(phi/bicubic_Interval) * bicubic_Interval;
% Interpolation
[Xq, Yq] = meshgrid(0:bicubic_Interval:1);
Vq = interp2([0 1],[0 1],[L_z(L_y_floor-1,L_x_floor) L_z(L_y_floor-1,L_x_floor+1);L_z(L_y_floor,L_x_floor) L_z(L_y_floor,L_x_floor+1)],Xq,Yq);
Z = Vq(L_y_phi/bicubic_Interval+1,L_x_phi/bicubic_Interval+1);

end

