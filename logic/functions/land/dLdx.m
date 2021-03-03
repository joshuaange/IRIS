function [dX] = dLdx(X,Y)
%DLDX Finds the partial x derivative for point X,Y

PointMinus = L(X-0.5,Y);
PointPlus = L(X+0.5,Y);

dX = (PointPlus - PointMinus);


end

