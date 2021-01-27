function [A, B, C, D, angle] = multiply(ap, bp, cp, dp, Anglep, ag, bg, cg, dg, Angleg)
% Multiplies two quaternions together (p*g)
A = (ag*ap-bg*bp-cg*cp-dg*dp);
B = (ag*bp+bg*ap-cg*dp+dg*cp);
C = (ag*cp+bg*dp+cg*ap-dg*bp);
D = (ag*dp-bg*cp+cg*bp+dg*ap);
angle = acos(A);
end