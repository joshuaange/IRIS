function [vec_FR, vec_FG, K_avg, DV, vec_FE, vec_BG, F_avg, FJ, vec_FF] = III_reactions(S, T, velocityHit, mass, gravity, K, F, dLdxS, dLdyS, S_2, vec_O)
%Reaction forces
%   Called by control.m
% Equal Reaction Vector
%vec_FR = [(S(1)+velocityHit(2,1)) (S(2)+velocityHit(2,2)) (S(3)+velocityHit(2,3)); (S_2(1)-(S(1)+mass*velocityHit(2,1))) (S_2(2)-(S(2)+mass*velocityHit(2,2))) (S_2(3)-(S(3)+mass*velocityHit(2,3)))];
vec_FR = [S(1) S(2) S(3); 0 0 0];

% Gravitational Reaction Vector
%vec_FG = [S(1) S(2) S(3); 0 0 -((mass*mass)*gravity)];
vec_FG = [S(1) S(2) S(3); 0 0 0];

% Elasticity Reaction Vector
K_avg = (K(S(1),S(2))+K(S_2(1),S_2(2)))/2;
DV = (T*K_avg*(vec_mag(velocityHit)))/mass;
%vec_FE = [S_2(1) S_2(2) S_2(3); (mass/T)*DV*cos(vec_alpha(vec_FR)) (mass/T)*DV*cos(vec_beta(vec_FR)) (mass/T)*DV*cos(vec_gamma(vec_FR))];
vec_FE = [S_2(1) S_2(2) S_2(3); 0 0 0];

% Frictional Reaction Vector
vec_BG = [S(1) S(2) S(3); T*mass*gravity*dLdxS T*mass*gravity*dLdyS -T*mass*gravity];
F_avg = (F(S(1),S(2))+F(S_2(1),S_2(2)))/2;
FJ = sqrt((F_avg*(vec_FR(2,1)+vec_FE(2,1)+vec_BG(2,1)))^2+(F_avg*(vec_FR(2,2)+vec_FE(2,2)+vec_BG(2,2)))^2+(F_avg*(vec_FR(2,3)+vec_FE(2,3)+vec_BG(2,3)))^2);
% End friction
if vec_mag(vec_O) == 0 
	vec_FF = [S_2(1) S_2(2) S_2(3); 0 0 0];
else
    vec_FF = [S_2(1) S_2(2) S_2(3); 0 0 0];
	% vec_FF = [S_2(1) S_2(2) S_2(3); (mass/T)*(FJ*((S(1)-S_2(1))/vec_mag(vec_O))) (mass/T)*(FJ*((S(2)-S_2(2))/vec_mag(vec_O))) (mass/T)*((S(3)-S_2(3))/vec_mag(vec_O))];
end;
end

