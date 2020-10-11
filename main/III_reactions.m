function [vec_VR, vec_VG, K_avg, DV, vec_VE, vec_BG, F_avg, FJ, vec_VF] = III_reactions(S, T, velocityHit, mass, gravity, K, F, dLdxS, dLdyS, S_2, vec_O)
%Reaction forces
%   Called by control.m
% Equal Reaction Vector
vec_VR = [(S(1)+T*velocityHit(2,1)) (S(2)+T*velocityHit(2,2)) (S(3)+T*velocityHit(2,3)); (S_2(1)-(S(1)+T*velocityHit(2,1))) (S_2(2)-(S(2)+T*velocityHit(2,2))) (S_2(3)-(S(3)+T*velocityHit(2,3)))];

% Gravitational Reaction Vector
vec_VG = [S(1) S(2) S(3); 0 0 -T*mass*gravity];

% Elasticity Reaction Vector
K_avg = (K(S(1),S(2))+K(S_2(1),S_2(2)))/2;
DV = (T*K_avg*(vec_mag(velocityHit)))/mass;
vec_VE = [S_2(1) S_2(2) S_2(3); DV*cos(vec_alpha(vec_VR)) DV*cos(vec_beta(vec_VR)) DV*cos(vec_gamma(vec_VR))];

% Frictional Reaction Vector
vec_BG = [S(1) S(2) S(3); T*mass*gravity*dLdxS T*mass*gravity*dLdyS -T*mass*gravity];
F_avg = (F(S(1),S(2))+F(S_2(1),S_2(2)))/2;
FJ = sqrt((F_avg*(vec_VR(2,1)+vec_VE(2,1)+vec_BG(2,1)))^2+(F_avg*(vec_VR(2,2)+vec_VE(2,2)+vec_BG(2,2)))^2+(F_avg*(vec_VR(2,3)+vec_VE(2,3)+vec_BG(2,3)))^2);
% End friction
if vec_mag(vec_O) == 0 
	vec_VF = [S_2(1) S_2(2) S_2(3); 0 0 0];
else
	vec_VF = [S_2(1) S_2(2) S_2(3); (FJ*((S(1)-S_2(1))/vec_mag(vec_O))) (FJ*((S(2)-S_2(2))/vec_mag(vec_O))) ((S(3)-S_2(3))/vec_mag(vec_O))];
end;
end

