function [alpha] = falpha(vector)
% Finds alpha (x) angle of vector
alpha = acos((vector(2,1))/(vec_mag(vector)));
end