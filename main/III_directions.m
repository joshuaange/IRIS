function [dLdxS, dLdyS, N, vec_N, vec_PN, vec_P, vec_B, mag, S_2, vec_O] = III_directions(L, S, velocityHit, T, dLdx, dLdy)
% Directional/Planar setup
%   Called by control.m
syms x y M MM
% Normal/Tangent Plane
dLdxS = dLdx(S(1),S(2));
dLdyS = dLdy(S(1),S(2));
N = matlabFunction((dLdxS*(x - S(1)) + dLdyS*(y - S(2)) + (S(3))),'Vars',[x y]);

% Normal Vector
vec_N = [S(1) S(2) S(3); -dLdxS -dLdyS 1];
% Parallel Vector
try
    magEquationTest = N(velocityHit(1,1)+velocityHit(2,1)+MM*cos(vec_alpha(vec_N)),velocityHit(1,2)+velocityHit(2,2)+MM*cos(vec_beta(vec_N))) == velocityHit(1,3)+velocityHit(2,3)+MM*cos(vec_gamma(vec_N));
    magTest = vpasolve(magEquationTest, MM);
catch
    magTest = 0;
end
vec_PN = [velocityHit(1,1)+velocityHit(2,1)+magTest*cos(vec_alpha(vec_N)) velocityHit(1,2)+velocityHit(2,2)+magTest*cos(vec_beta(vec_N)) velocityHit(1,3)+velocityHit(2,3)+magTest*cos(vec_gamma(vec_N))];
vec_P = [S(1) S(2) S(3); T*(vec_PN(1)) T*(vec_PN(2)) T*(vec_PN(3))];
% Perpendicular Vector
vec_B = [(S(1) + vec_P(2,1)) (S(2) + vec_P(2,2)) (S(3) + vec_P(2,3)); dLdxS dLdyS -1];

quiver3(vec_N(1,1)+vec_PN(1,1),vec_N(1,2)+vec_PN(1,2),vec_N(1,3)+vec_PN(1,3),vec_N(2,1),vec_N(2,2),vec_N(2,3),'lineWidth',1,'Color','cyan','MaxHeadSize',0.5,'DisplayName','vec_{N}','lineStyle',':');
quiver3(vec_N(1,1),vec_N(1,2),vec_N(1,3),vec_N(2,1),vec_N(2,2),vec_N(2,3),'lineWidth',1,'Color','cyan','MaxHeadSize',0.5,'DisplayName','vec_{N}','lineStyle',':');
quiver3(S(1),S(2),S(3),vec_PN(1),vec_PN(2),vec_PN(3),'lineWidth',1,'Color','y','MaxHeadSize',0.5,'DisplayName','vec_{PN}','lineStyle','--');
quiver3(vec_B(1,1),vec_B(1,2),vec_B(1,3),vec_B(2,1),vec_B(2,2),vec_B(2,3),'lineWidth',1,'Color','magenta','MaxHeadSize',0.5,'DisplayName','vec_{B}','lineStyle',':');
quiver3(vec_P(1,1),vec_P(1,2),vec_P(1,3),vec_P(2,1),vec_P(2,2),vec_P(2,3),'lineWidth',1,'Color','red','MaxHeadSize',0.5,'DisplayName','vec_{P}','lineStyle',':');
plot3(S(1),S(2),S(3),'Marker','o','DisplayName','End Point','Color','red');

% Finding Magnitude to Terrain
try
    magEquation = L(M*cos((vec_alpha(vec_B)))+vec_P(2,1)+S(1),M*cos(vec_beta(vec_B))+vec_P(2,2)+S(2))==M*cos(vec_gamma(vec_B))+vec_P(2,3)+S(3);
    mag = vpasolve(magEquation, M);
catch
    %magEquation = L(-M*cos((vec_alpha(vec_B)))+vec_P(2,1)+S(1),-M*cos(vec_beta(vec_B))+vec_P(2,2)+S(2))==-M*cos(vec_gamma(vec_B))+vec_P(2,3)+S(3);
    %mag = vpasolve(magEquation, M);
    mag = 0;
end

% Next Starting Point Location
S_2 = [(mag*cos(vec_alpha(vec_B))+T*vec_PN(1)+S(1)) (mag*cos(vec_beta(vec_B))+T*vec_PN(2)+S(2)) (mag*cos(vec_gamma(vec_B))+T*vec_PN(3)+S(3))];

% Traced Segment Vector
vec_O = [S(1) S(2) S(3); S_2(1)-S(1) S_2(2)-S(2) S_2(3)-S(3)];
end

