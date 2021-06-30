function [Z] = Y_l(X,Y)
% Y_l Finds the interpolated value on the heightmap for input coordinates

global Y_l_x Y_l_y Y_l_z Domain Bi_Int Xq Yq
syms VAY_l

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
    Y_l_x_floor = find(Y_l_x==floor(X/(Domain/size(Y_l_z,1))) * (Domain/size(Y_l_z,1)));
    if biggerX == 1
        Y_l_x_floor = Y_l_x_floor + size(Y_l_z,1)/2;
        X = X + Domain/2;
    end
    phi = vpasolve(Y_l_x(Y_l_x_floor) + (Domain/size(Y_l_z,1))*VAY_l == X,VAY_l);
    Y_l_x_phi = round(phi/Bi_Int) * Bi_Int;
    % Finding Y Index
    Y_l_y_floor = find(Y_l_y==floor(Y/(Domain/size(Y_l_z,2))) * (Domain/size(Y_l_z,2)));
    if biggerY == 1
        Y_l_y_floor = Y_l_y_floor + size(Y_l_z,2)/2;
        Y = Y + Domain/2;
    end
    phi = vpasolve(Y_l_y(Y_l_y_floor) + (Domain/size(Y_l_z,2))*VAY_l == Y,VAY_l);
    Y_l_y_phi = round(phi/Bi_Int) * Bi_Int;

    % Border considerations
    if Y_l_y_floor == 1
        Y_l_y_floor = 2;
    end
    if Y_l_x_floor == size(Y_l_y,2)
        Y_l_x_floor = size(Y_l_y,2)-1;
    end

    % Interpolation
    %[Xq, Yq] = meshgrid(0:Bi_Int:1);
    Vq = interp2([0 1],[0 1],[Y_l_z(Y_l_y_floor-1,Y_l_x_floor) Y_l_z(Y_l_y_floor-1,Y_l_x_floor+1); Y_l_z(Y_l_y_floor,Y_l_x_floor) Y_l_z(Y_l_y_floor,Y_l_x_floor+1)],Xq,Yq);
    Z = Vq(Y_l_y_phi/Bi_Int+1,Y_l_x_phi/Bi_Int+1);
catch
    Z = 0;
end

end