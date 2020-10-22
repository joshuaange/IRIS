function [vec, angle] = quat_toVector(a, b, c, d, startx, starty, startz)
%QUAT_TOVECTOR
%   Converts a+bi+cj+dk quaternion notation to vector-angle notation

angle = real(acos(a));
vec = [startx, starty, startz; b/(sin(angle)), c/(sin(angle)), d/(sin(angle))];

end

