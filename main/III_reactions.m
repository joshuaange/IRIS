function [vec_VE, vec_Norm, vec_VG, vec_VF, quatV_pInfluence, quatA_pInfluence, quatV_next, quatA_next, vec_rotVelocity] = III_reactions(S, T, gravity, velocityHit, jit, S_new, K, s, iit, minimumRestitution, KT, vec_O, F, dLdxS, dLdyS, R, mass, diameter, quatV_ground, quatA_ground, N, U, vec_N_new, L, mag, vec_P, minimumFlatness, vec_B, YM, G, podMaterialProp, vec_PN)
%Reaction forces
%   Called by control.m

% GRAVITY
vec_VG = [S(1) S(2) S(3); 0 0 -mass*gravity*T];

% APPLIED LINEAR
% velocityHit

% NORMAL
vec_VR = [(S(1) + vec_P(2,1)) (S(2) + vec_P(2,2)) (S(3) + vec_P(2,3)); mag*cos(vec_alpha(vec_B)) mag*cos(vec_beta(vec_B)) mag*cos(vec_gamma(vec_B))];
vec_VER = [(S(1)+(T)*velocityHit(2,1)) (S(2)+(T)*velocityHit(2,2)) (S(3)+(T)*velocityHit(2,3)); (S_new(1)-(S(1)+(T)*velocityHit(2,1))) (S_new(2)-(S(2)+(T)*velocityHit(2,2))) (S_new(3)-(S(3)+(T)*velocityHit(2,3)))];
   % Normal Vector (Gravity)
syms x y
dNdx = matlabFunction(diff(N,x),'Vars',[x y]);
dNdy = matlabFunction(diff(N,y),'Vars',[x y]);
dNdxS = dNdx(S(1),S(2));
dNdyS = dNdy(S(1),S(2));
vec_VG_theta = [S(1) S(2) S(3); -(dNdxS)/(sqrt((dNdyS^2)+(dNdxS^2))) -(dNdyS)/(sqrt((dNdyS^2)+(dNdxS^2))) N(S(1)-((dNdxS)/(sqrt((dNdyS^2)+(dNdxS^2)))),S(2)-((dNdyS)/(sqrt((dNdyS^2)+(dNdxS^2)))))];
if dLdxS < minimumFlatness
    vec_VG_theta(2,1) = 0;
end
if dLdyS < minimumFlatness
    vec_VG_theta(2,2) = 0;
end
   % Normal Vector 
vec_Norm = [S(1) S(2) S(3); vec_VG_theta(2,1)+vec_VR(2,1) vec_VG_theta(2,2)+vec_VR(2,2) vec_VG_theta(2,3)+vec_VR(2,3)];

% SPRING
K_avg = ((K(S(1),S(2))+K(S_new(1),S_new(2)))/2);
   % These calculations convert readable COR to usable COR
K_calc = 2*(0.84798087*(K_avg^3) - 1.6885521*(K_avg^2) + 1.41395526*(K_avg) + 0.48879599);
if K_avg <= minimumRestitution
    K_calc = 2*(-5208.3333*(K_avg^2) + 104.166666*(K_avg));
end
vec_VEFake = [vec_VER(1,1)+vec_VER(2,1) vec_VER(1,2)+vec_VER(2,2) vec_VER(1,3)+vec_VER(2,3); -K_calc*(velocityHit(2,1)+vec_VER(2,1)) -K_calc*(velocityHit(2,2)+vec_VER(2,2)) -K_calc*(velocityHit(2,3)+vec_VER(2,3))];
vec_VE = [vec_VER(1,1)+vec_VER(2,1) vec_VER(1,2)+vec_VER(2,2) vec_VER(1,3)+vec_VER(2,3); vec_mag(vec_VEFake)*cos(vec_alpha(vec_VER)) vec_mag(vec_VEFake)*cos(vec_beta(vec_VER)) vec_mag(vec_VEFake)*cos(vec_gamma(vec_VER))];

% FRICTIONAL
F_avg = ((F(S(1),S(2))+F(S_new(1),S_new(2)))/2);
vec_VF = [vec_O(1,1)+vec_O(2,1) vec_O(1,2)+vec_O(2,2) vec_O(1,3)+vec_O(2,3) ; ((-F_avg*vec_mag(vec_Norm)*cos(vec_alpha(vec_O)))) ((-F_avg*vec_mag(vec_Norm)*cos(vec_beta(vec_O)))) ((-F_avg*vec_mag(vec_Norm)*cos(vec_gamma(vec_O))))];

% APPLIED ROTATIONAL
quatV_pInfluence = [S(1) S(2) S(3); -(dLdyS)/(sqrt((dLdyS^2)+(dLdxS^2))) (dLdxS)/(sqrt((dLdyS^2)+(dLdxS^2))) 0];
R_avg = ((R(S(1),S(2))+R(S_new(1),S_new(2)))/2);
pJ = (T*R_avg*mass*(vec_mag(vec_VR)/T))/mass;
quatA_pInfluence = 2*pi*((-(vec_mag(vec_O))/(diameter/2))+(pJ/(diameter/2)));
[ap, bp, cp, dp] = quat_toQuat(quatV_pInfluence, quatA_pInfluence);
[ag, bg, cg, dg] = quat_toQuat(quatV_ground, quatA_ground);
[aa, bb, cc, dd] = quat_add(ap, bp, cp, dp, ag, bg, cg, dg);
[quatV_nextFake, quatA_next] = quat_toVector(aa, bb, cc, dd, S(1), S(2), S(3));
quatV_next = vec_normalize(quatV_nextFake);
vec_rotVelocityFake = [S_new(1) S_new(2) S_new(3); -quatV_next(2,2) quatV_next(2,1) N(S_new(1)-quatV_next(2,2), S_new(2)+quatV_next(2,1))-S_new(3)];
vec_rotVelocity = [S_new(1) S_new(2) S_new(3); -(diameter/2)*(quatA_next/(2*pi))*cos(vec_alpha(vec_rotVelocityFake)) -(diameter/2)*(quatA_next/(2*pi))*cos(vec_beta(vec_rotVelocityFake)) -(diameter/2)*(quatA_next/(2*pi))*cos(vec_gamma(vec_rotVelocityFake))];

end
