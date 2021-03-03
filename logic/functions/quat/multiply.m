function [A, B, C, D, angle] = multiply(ap, bp, cp, dp, Anglep, ag, bg, cg, dg, Angleg)
% Multiplies two quaternions together (p*g)
A = (ag*ap-bg*bp-cg*cp-dg*dp);
B = (ag*bp+bg*ap-cg*dp+dg*cp);
C = (ag*cp+bg*dp+cg*ap-dg*bp);
D = (ag*dp-bg*cp+cg*bp+dg*ap);
positive = 0;
negative = 0;
while A>1
    positive = positive + 1;
    A = A - 1;
end
while A<-1
    negative = negative + 1;
    A = A + 1;
end

angle = acos(A);

angle = angle + (2*pi)*(Anglep/(2*pi) + Angleg/(2*pi));
angle = angle + acos(positive) - acos(negative);
end