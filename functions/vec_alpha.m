function [alpha] = alpha(vector)
% Finds alpha (x) angle of input vector
    alpha = acos((vector(2,1))/(mag(vector)));
end