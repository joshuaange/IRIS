function [Z] = G_l(X,Y)
% G_l Finds the interpolated value on the heightmap for input coordinates

global G_l_x G_l_y G_l_z Domain Bi_Int Xq Yq
syms VAG_l

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
    G_l_x_floor = find(G_l_x==floor(X/(Domain/size(G_l_z,1))) * (Domain/size(G_l_z,1)));
    if biggerX == 1
        G_l_x_floor = G_l_x_floor + size(G_l_z,1)/2;
        X = X + Domain/2;
    end
    phi = vpasolve(G_l_x(G_l_x_floor) + (Domain/size(G_l_z,1))*VAG_l == X,VAG_l);
    G_l_x_phi = round(phi/Bi_Int) * Bi_Int;
    % Finding Y Index
    G_l_y_floor = find(G_l_y==floor(Y/(Domain/size(G_l_z,2))) * (Domain/size(G_l_z,2)));
    if biggerY == 1
        G_l_y_floor = G_l_y_floor + size(G_l_z,2)/2;
        Y = Y + Domain/2;
    end
    phi = vpasolve(G_l_y(G_l_y_floor) + (Domain/size(G_l_z,2))*VAG_l == Y,VAG_l);
    G_l_y_phi = round(phi/Bi_Int) * Bi_Int;

    % Border considerations
    if G_l_y_floor == 1
        G_l_y_floor = 2;
    end
    if G_l_x_floor == size(G_l_y,2)
        G_l_x_floor = size(G_l_y,2)-1;
    end

    % Interpolation
    %[Xq, Yq] = meshgrid(0:Bi_Int:1);
    Vq = interp2([0 1],[0 1],[G_l_z(G_l_y_floor-1,G_l_x_floor) G_l_z(G_l_y_floor-1,G_l_x_floor+1); G_l_z(G_l_y_floor,G_l_x_floor) G_l_z(G_l_y_floor,G_l_x_floor+1)],Xq,Yq);
    Z = Vq(G_l_y_phi/Bi_Int+1,G_l_x_phi/Bi_Int+1);
catch
    Z = 0;
end

end