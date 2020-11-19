function [W, theta, vec_VR, vec_VG, vec_VE, vec_VF, K_avg, quatV_pInfluence, quatA_pInfluence, quatV_next, quatA_next, vec_rotVelocity] = III_reactions(S, T, gravity, velocityHit, jit, S_new, K, s, iit, minimumRestitution, KT, vec_O, F, dLdxS, dLdyS, R, mass, diameter, quatV_ground, quatA_ground, N, U, vec_N_new, L, mag, vec_B)
%Reaction forces
%   Called by control.m
% Equal Reaction Vector
vec_VRfake = [(S(1)+(T)*velocityHit(2,1)) (S(2)+(T)*velocityHit(2,2)) (S(3)+(T)*velocityHit(2,3)); (S_new(1)-(S(1)+(T)*velocityHit(2,1))) (S_new(2)-(S(2)+(T)*velocityHit(2,2))) (S_new(3)-(S(3)+(T)*velocityHit(2,3)))];
%vec_VR = [vec_VRfake(1,1) vec_VRfake(1,2) vec_VRfake(1,3); ((jit)*vec_mag(vec_VRfake))*cos(vec_alpha(vec_VRfake)) ((jit)*vec_mag(vec_VRfake))*cos(vec_beta(vec_VRfake)) ((jit)*vec_mag(vec_VRfake))*cos(vec_gamma(vec_VRfake))];
vec_VR = vec_VRfake;
%vec_VR = [velocityHit(1,1)+T*velocityHit(2,1) velocityHit(1,2)+T*velocityHit(2,2) velocityHit(1,3)+T*velocityHit(2,3); T*mag*cos(vec_alpha(vec_B)) T*mag*cos(vec_beta(vec_B)) T*mag*cos(vec_gamma(vec_B))];

% Elasticity Reaction Vector
K_avg = ((K(S(1),S(2))+K(S_new(1),S_new(2)))/2);
KT_avg = ((KT(S(1),S(2))+KT(S_new(1),S_new(2)))/2);
% These calculations convert readable COR to usable COR
K_calc = 2*(0.84798087*(K_avg^3) - 1.6885521*(K_avg^2) + 1.41395526*(K_avg) + 0.48879599);
if K_avg <= minimumRestitution
    K_calc = 2*(-5208.3333*(K_avg^2) + 104.166666*(K_avg));
end
if jit > 1
    vec_VEFake = [vec_VR(1,1)+vec_VR(2,1) vec_VR(1,2)+vec_VR(2,2) vec_VR(1,3)+vec_VR(2,3); -K_calc*KT_avg*(s{iit,jit-1}.velocityHit(2,1)+s{iit,jit-1}.vec_VR(2,1)) -K_calc*KT_avg*(s{iit,jit-1}.velocityHit(2,2)+s{iit,jit-1}.vec_VR(2,2)) -K_calc*KT_avg*(s{iit,jit-1}.velocityHit(2,3)+s{iit,jit-1}.vec_VR(2,3))];
    vec_VE = [vec_VR(1,1)+vec_VR(2,1) vec_VR(1,2)+vec_VR(2,2) vec_VR(1,3)+vec_VR(2,3); vec_mag(vec_VEFake)*cos(vec_alpha(vec_VR)) vec_mag(vec_VEFake)*cos(vec_beta(vec_VR)) vec_mag(vec_VEFake)*cos(vec_gamma(vec_VR))];
else
    vec_VEFake = [vec_VR(1,1)+vec_VR(2,1) vec_VR(1,2)+vec_VR(2,2) vec_VR(1,3)+vec_VR(2,3); 0 0 0];
    vec_VE = [vec_VR(1,1)+vec_VR(2,1) vec_VR(1,2)+vec_VR(2,2) vec_VR(1,3)+vec_VR(2,3); 0 0 0];
end

% Frictional Reaction Vector
F_avg = ((F(S(1),S(2))+F(S_new(1),S_new(2)))/2);
vec_VF = [vec_O(1,1)+vec_O(2,1) vec_O(1,2)+vec_O(2,2) vec_O(1,3)+vec_O(2,3) ; -F_avg*vec_O(2,1) -F_avg*vec_O(2,2) -F_avg*vec_O(2,3)];

% Spin
quatV_pInfluence = [S(1) S(2) S(3); -(dLdyS)/(sqrt((dLdyS^2)+(dLdxS^2))) (dLdxS)/(sqrt((dLdyS^2)+(dLdxS^2))) 0];
R_avg = ((R(S(1),S(2))+R(S_new(1),S_new(2)))/2);
pJ = (T*R_avg*mass*(vec_mag(vec_VR)/T))/mass;
quatA_pInfluence = 2*pi*((-(vec_mag(vec_O))/(diameter/2))+(pJ/(diameter/2)));

[ap, bp, cp, dp] = quat_toQuat(quatV_pInfluence, quatA_pInfluence);
[ag, bg, cg, dg] = quat_toQuat(quatV_ground, quatA_ground);
[quatV_nextFake, quatA_next] = quat_toVector(ap+ag, bp+bg, cp+cg, dp+dg, S(1), S(2), S(3));
quatV_next = vec_normalize(quatV_nextFake);

vec_rotVelocityFake = [S_new(1) S_new(2) S_new(3); -quatV_next(2,2) quatV_next(2,1) N(S_new(1)-quatV_next(2,2), S_new(2)+quatV_next(2,1))-S_new(3)];
vec_rotVelocity = [S_new(1) S_new(2) S_new(3); (diameter/2)*(quatA_next/(2*pi))*cos(vec_alpha(vec_rotVelocityFake)) (diameter/2)*(quatA_next/(2*pi))*cos(vec_beta(vec_rotVelocityFake)) (diameter/2)*(quatA_next/(2*pi))*cos(vec_gamma(vec_rotVelocityFake))];

% Gravitational Reaction Vector
vec_N_new_tangent = vec_normalize(vec_N_new);
theta = acos((((U(2,1))*(vec_N_new_tangent(2,1)))+((U(2,2))*(vec_N_new_tangent(2,2)))+((U(2,3))*(vec_N_new_tangent(2,3))))/(vec_mag(U)*vec_mag(vec_N_new_tangent)));
W = (T*gravity)*sin(theta);
%vec_VG = [S(1) S(2) S(3); W*cos(vec_alpha(vec_O)) W*cos(vec_beta(vec_O)) W*cos(vec_gamma(vec_O))];
%vec_VG = [S(1) S(2) S(3); W*cos(vec_alpha(vec_O)) W*cos(vec_beta(vec_O)) L(S(1)+W*cos(vec_alpha(vec_O)),S(2)+W*cos(vec_beta(vec_O)))];
syms x y
dNdx = matlabFunction(diff(N,x),'Vars',[x y]);
dNdy = matlabFunction(diff(N,y),'Vars',[x y]);
dNdxS = dNdx(S(1),S(2));
dNdyS = dNdy(S(1),S(2));
vec_VG = [S(1) S(2) S(3); -(dNdxS)/(sqrt((dNdyS^2)+(dNdxS^2))) -(dNdyS)/(sqrt((dNdyS^2)+(dNdxS^2))) N(S(1)-((dNdxS)/(sqrt((dNdyS^2)+(dNdxS^2)))),S(2)-((dNdyS)/(sqrt((dNdyS^2)+(dNdxS^2)))))];
end