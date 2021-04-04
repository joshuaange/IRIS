function [Z] = K(X,Y)
% K Finds the interpolated value on the heightmap for input coordinates

global K_x K_y K_z Domain Bi_Int Xq Yq
syms VAK

try
    % Finding X Index
    K_x_floor = find(K_x==floor(X/(Domain/size(K_z,1))) * (Domain/size(K_z,1)));
    phi = vpasolve(K_x(K_x_floor) + (Domain/size(K_z,1))*VAK == X,VAK);
    K_x_phi = round(phi/Bi_Int) * Bi_Int;
    % Finding Y Index
    K_y_floor = find(K_y==floor(Y/(Domain/size(K_z,2))) * (Domain/size(K_z,2)));
    phi = vpasolve(K_y(K_y_floor) + (Domain/size(K_z,2))*VAK == Y,VAK);
    K_y_phi = round(phi/Bi_Int) * Bi_Int;

    % Interpolation
    %[Xq, Yq] = meshgrid(0:Bi_Int:1);
    Vq = interp2([0 1],[0 1],[K_z(K_y_floor-1,K_x_floor) K_z(K_y_floor-1,K_x_floor+1); K_z(K_y_floor,K_x_floor) K_z(K_y_floor,K_x_floor+1)],Xq,Yq);
    Z = Vq(K_y_phi/Bi_Int+1,K_x_phi/Bi_Int+1);
catch
    Z = 0;
end

end