function [Z] = F(X,Y)
% F Finds the interpolated value on the heightmap for input coordinates

global F_x F_y F_z Domain Bi_Int Xq Yq
syms VAF

try
    % Finding X Index
    F_x_floor = find(F_x==floor(X/(Domain/size(F_z,1))) * (Domain/size(F_z,1)));
    phi = vpasolve(F_x(F_x_floor) + (Domain/size(F_z,1))*VAF == X,VAF);
    F_x_phi = round(phi/Bi_Int) * Bi_Int;
    % Finding Y Index
    F_y_floor = find(F_y==floor(Y/(Domain/size(F_z,2))) * (Domain/size(F_z,2)));
    phi = vpasolve(F_y(F_y_floor) + (Domain/size(F_z,2))*VAF == Y,VAF);
    F_y_phi = round(phi/Bi_Int) * Bi_Int;

    % Interpolation
    %[Xq, Yq] = meshgrid(0:Bi_Int:1);
    Vq = interp2([0 1],[0 1],[F_z(F_y_floor-1,F_x_floor) F_z(F_y_floor-1,F_x_floor+1); F_z(F_y_floor,F_x_floor) F_z(F_y_floor,F_x_floor+1)],Xq,Yq);
    Z = Vq(F_y_phi/Bi_Int+1,F_x_phi/Bi_Int+1);
catch
    Z = 0;
end

end