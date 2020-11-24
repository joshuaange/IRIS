function [vec, angle] = quat_toVector(a, b, c, d, startx, starty, startz)
%QUAT_TOVECTOR
%   Converts a+bi+cj+dk quaternion notation to vector-angle notation

angle = 2*real(acos(a));
vec = [startx, starty, startz; b/(sin(angle/2)), c/(sin(angle/2)), d/(sin(angle/2))];
end

