function [gamma] = fgamma(vector)
% Findz gamma (z) angle of vector
gamma = acos((vector(2,3))/(mag(vector)));
end