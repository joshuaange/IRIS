function [Z] = T_g(X,Y)
% T_g Finds the interpolated value on the heightmap for input coordinates

global T_g_x T_g_y T_g_z Domain Bi_Int Xq Yq
syms VAT_g

biggerX = 0;
biggerY = 0;

try
    X = double(X);
    Y = double(Y);
    % Finding X Index
    if X >= Domain/2
        biggerX = 1;
        X = X - Domain/2;
    end
    if Y >= Domain/2
        biggerY = 1;
        Y = Y - Domain/2;
    end
    T_g_x_floor = find(T_g_x==floor(X/(Domain/size(T_g_z,1))) * (Domain/size(T_g_z,1)));
    if biggerX == 1
        T_g_x_floor = T_g_x_floor + size(T_g_z,1)/2;
        X = X + Domain/2;
    end
    phi = vpasolve(T_g_x(T_g_x_floor) + (Domain/size(T_g_z,1))*VAT_g == X,VAT_g);
    T_g_x_phi = round(phi/Bi_Int) * Bi_Int;
    % Finding Y Index
    T_g_y_floor = find(T_g_y==floor(Y/(Domain/size(T_g_z,2))) * (Domain/size(T_g_z,2)));
    if biggerY == 1
        T_g_y_floor = T_g_y_floor + size(T_g_z,2)/2;
        Y = Y + Domain/2;
    end
    phi = vpasolve(T_g_y(T_g_y_floor) + (Domain/size(T_g_z,2))*VAT_g == Y,VAT_g);
    T_g_y_phi = round(phi/Bi_Int) * Bi_Int;

    % Border considerations
    if T_g_y_floor == 1
        T_g_y_floor = 2;
    end
    if T_g_x_floor == size(T_g_y,2)
        T_g_x_floor = size(T_g_y,2)-1;
    end

    % Interpolation
    %[Xq, Yq] = meshgrid(0:Bi_Int:1);
    Vq = interp2([0 1],[0 1],[T_g_z(T_g_y_floor-1,T_g_x_floor) T_g_z(T_g_y_floor-1,T_g_x_floor+1); T_g_z(T_g_y_floor,T_g_x_floor) T_g_z(T_g_y_floor,T_g_x_floor+1)],Xq,Yq);
    Z = Vq(T_g_y_phi/Bi_Int+1,T_g_x_phi/Bi_Int+1);
catch
    Z = 0;
end

end