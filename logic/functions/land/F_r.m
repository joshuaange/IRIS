function [Z] = F_r(X,Y)
% F_r Finds the interpolated value on the heightmap for input coordinates

global F_r_x F_r_y F_r_z Domain Bi_Int
syms VAF_r

try
    % Finding X Index
    F_r_x_floor = find(F_r_x==floor(X/(Domain/size(F_r_z,1))) * (Domain/size(F_r_z,1)));
    phi = vpasolve(F_r_x(F_r_x_floor) + (Domain/size(F_r_z,1))*VAF_r == X,VAF_r);
    F_r_x_phi = round(phi/Bi_Int) * Bi_Int;
    % Finding Y Index
    F_r_y_floor = find(F_r_y==floor(Y/(Domain/size(F_r_z,2))) * (Domain/size(F_r_z,2)));
    phi = vpasolve(F_r_y(F_r_y_floor) + (Domain/size(F_r_z,2))*VAF_r == Y,VAF_r);
    F_r_y_phi = round(phi/Bi_Int) * Bi_Int;

    % Interpolation
    [Xq, Yq] = meshgrid(0:Bi_Int:1);
    Vq = interp2([0 1],[0 1],[F_r_z(F_r_y_floor-1,F_r_x_floor) F_r_z(F_r_y_floor-1,F_r_x_floor+1); F_r_z(F_r_y_floor,F_r_x_floor) F_r_z(F_r_y_floor,F_r_x_floor+1)],Xq,Yq);
    Z = Vq(F_r_y_phi/Bi_Int+1,F_r_x_phi/Bi_Int+1);
catch
    Z = 0;
end

end