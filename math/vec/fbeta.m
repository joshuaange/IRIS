function [beta] = fbeta(vector)
% Finds beta (y) angle of vector
beta = acos((vector(2,2))/(mag(vector)));
end