function [outvec] = vec_normalize(invec)
%VEC_NORMALIZE
%   Turns vector to unit vector
thetaX = acos(invec(2,1)/vec_mag(invec));
thetaY = acos(invec(2,2)/vec_mag(invec));
thetaZ = acos(invec(2,3)/vec_mag(invec));

outvec = [invec(1,1) invec(1,2) invec(1,3); cos(thetaX) cos(thetaY) cos(thetaZ)];
end

