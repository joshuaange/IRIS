function [a, b, c, d] = quat_toQuat(vec, angle)
%QUAT_TOVECTOR
%   Converts vector-angle notation to a+bi+cj+dk quaternion notation

a = cos(angle/2);
b = sin(angle/2)*vec(2,1);
c = sin(angle/2)*vec(2,2);
d = sin(angle/2)*vec(2,3);

end

