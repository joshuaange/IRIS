function [alpha] = falpha(vector)
% Finds alpha (x) angle of vector
alpha = acos((vector(2,1))/(mag(vector)));
end