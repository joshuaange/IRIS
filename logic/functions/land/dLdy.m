function [dY] = dLdy(X,Y)
%DLDX Finds the partial y derivative for point X,Y

global Bi_Int

PointMinus = L(X,Y-Bi_Int);
PointPlus = L(X,Y+Bi_Int);

dY = (PointPlus - PointMinus);


end

