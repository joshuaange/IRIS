function [mag] = mag(vector)
%Finds magnitude of vector
mag = sqrt((vector(2,1))^2+(vector(2,2))^2+(vector(2,3))^2);
end