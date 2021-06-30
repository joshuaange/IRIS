function [Z] = L(X,Y)
% L Finds the interpolated value on the heightmap for input coordinates

global L_x L_y L_z Domain Bi_Int Xq Yq
syms VAL

try
    X = double(X);
    Y = double(Y);
    % Finding X Index
    if X >= Domain/2
        biggerX = 1;
        X = X - Domain;
    end
    if Y >= Domain/2
        biggerY = 1;
        Y = Y - Domain;
    end
    L_x_floor = find(L_x==floor(X/(Domain/size(L_z,1))) * (Domain/size(L_z,1)));
    if biggerX == 1
        L_x_floor = L_x_floor + size(L_z,1)/2;
    end
    phi = vpasolve(L_x(L_x_floor) + (Domain/size(L_z,1))*VAL == X,VAL);
    L_x_phi = round(phi/Bi_Int) * Bi_Int;
    % Finding Y Index
    L_y_floor = find(L_y==floor(Y/(Domain/size(L_z,2))) * (Domain/size(L_z,2)));
    if biggerY == 1
        L_y_floor = L_y_floor + size(L_z,2)/2;
    end
    phi = vpasolve(L_y(L_y_floor) + (Domain/size(L_z,2))*VAL == Y,VAL);
    L_y_phi = round(phi/Bi_Int) * Bi_Int;
    
    % Border considerations
    if L_y_floor == 1
        L_y_floor = 2;
    end
    if L_x_floor == size(L_y,2)
        L_x_floor = size(L_y,2)-1;
    end

    % Interpolation
    %[Xq, Yq] = meshgrid(0:Bi_Int:1);
    Vq = interp2([0 1],[0 1],[L_z(L_y_floor-1,L_x_floor) L_z(L_y_floor-1,L_x_floor+1); L_z(L_y_floor,L_x_floor) L_z(L_y_floor,L_x_floor+1)],Xq,Yq);
    Z = Vq(L_y_phi/Bi_Int+1,L_x_phi/Bi_Int+1);
catch
    Z = 0;
end

end