function [Z] = F(X,Y)
% F Finds the interpolated value on the heightmap for input coordinates

global F_x F_y F_z Domain Bi_Int Xq Yq
syms VAF

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
    F_x_floor = find(F_x==floor(X/(Domain/size(F_z,1))) * (Domain/size(F_z,1)));
    if biggerX == 1
        F_x_floor = F_x_floor + size(F_z,1)/2;
    end
    phi = vpasolve(F_x(F_x_floor) + (Domain/size(F_z,1))*VAF == X,VAF);
    F_x_phi = round(phi/Bi_Int) * Bi_Int;
    % Finding Y Index
    F_y_floor = find(F_y==floor(Y/(Domain/size(F_z,2))) * (Domain/size(F_z,2)));
    if biggerY == 1
        F_y_floor = F_y_floor + size(F_z,2)/2;
    end
    phi = vpasolve(F_y(F_y_floor) + (Domain/size(F_z,2))*VAF == Y,VAF);
    F_y_phi = round(phi/Bi_Int) * Bi_Int;

    % Border considerations
    if F_y_floor == 1
        F_y_floor = 2;
    end
    if F_x_floor == size(F_y,2)
        F_x_floor = size(F_y,2)-1;
    end

    % Interpolation
    %[Xq, Yq] = meshgrid(0:Bi_Int:1);
    Vq = interp2([0 1],[0 1],[F_z(F_y_floor-1,F_x_floor) F_z(F_y_floor-1,F_x_floor+1); F_z(F_y_floor,F_x_floor) F_z(F_y_floor,F_x_floor+1)],Xq,Yq);
    Z = Vq(F_y_phi/Bi_Int+1,F_x_phi/Bi_Int+1);
catch
    Z = 0;
end

end