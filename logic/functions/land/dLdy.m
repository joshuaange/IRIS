function [dY] = dLdy(X,Y)
%DLDX Finds the partial y derivative for point X,Y

PointMinus = L(X,Y-0.5);
PointPlus = L(X,Y+0.5);

dY = (PointPlus - PointMinus);


end

