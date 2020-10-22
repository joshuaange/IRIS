function [vec, angle] = quat_toVector(a, b, c, d, startx, starty, startz)
%QUAT_TOVECTOR
%   Converts a+bi+cj+dk quaternion notation to vector-angle notation

angle = real(acos(a));
if angle == 0
    % Just to avoid division by zero
    angle = 0.000000000000000000000000000000000000001;
end;
vec = [startx, starty, startz; b/(sin(angle)), c/(sin(angle)), d/(sin(angle))];
end

