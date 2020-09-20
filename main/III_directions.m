function [dLdx, dLdy, dLdxS, dLdyS, N, vec_N, vec_PN, vec_P, vec_B, mag, S_2, vec_O] = III_directions(L, S, velocityHit, T)
% Directional/Planar setup
%   Called by control.m
% Getting Partial Derivatives
syms x y M
dLdx = matlabFunction(diff(L,x),'Vars',[x y]);
dLdy = matlabFunction(diff(L,y),'Vars',[x y]);
% Normal/Tangent Plane
dLdxS = dLdx(S(1),S(2));
dLdyS = dLdy(S(1),S(2));
N = matlabFunction((dLdxS*(x - S(1)) + dLdyS*(y - S(2)) + (S(3))),'Vars',[x y]);

% Normal Vector
vec_N = [S(1) S(2) S(3); -dLdxS -dLdyS 1];
% Parallel Vector
vec_PN = (velocityHit(2,:))-(((velocityHit(2,:)).*(vec_N(2,:))/(vec_mag(vec_N))^2).*(vec_N(2,:)));
vec_P = [S(1) S(2) S(3); T*vec_PN(1) T*vec_PN(2) T*vec_PN(3)];
% Perpendicular Vector
vec_B = [(S(1) + vec_P(2,1)) (S(2) + vec_P(2,2)) (S(3) + vec_P(2,3)); dLdxS dLdyS -1];

% Finding Magnitude to Terrain
mag = vpasolve(L(M*cos((vec_alpha(vec_B)))+T*vec_P(2,1)+S(1),M*cos(vec_beta(vec_B))+T*vec_P(2,2)+S(2))==M*cos(vec_gamma(vec_B))+T*vec_P(2,3)+S(3), M);

% Next Starting Point Location
S_2 = [(mag*cos(vec_alpha(vec_B))+T*vec_P(2,1)+S(1)) (mag*cos(vec_beta(vec_B))+T*vec_P(2,2)+S(2)) (mag*cos(vec_gamma(vec_B))+T*vec_P(2,3)+S(3))];

% Traced Segment Vector
vec_O = [S(1) S(2) S(3); S_2(1)-S(1) S_2(2)-S(2) S_2(3)-S(3)];
end

