function [dX] = dLdx(X,Y)
%DLDX Finds the partial x derivative for point X,Y

global Bi_Int

PointMinus = L(X-Bi_Int,Y);
PointPlus = L(X+Bi_Int,Y);

dX = (PointPlus - PointMinus);


end

