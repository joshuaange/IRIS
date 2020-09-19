function [beta] = beta(vector)
% Finds geta (y) angle of input vector
    beta = acos((vector(2,2))/(mag(vector)));
end