function [vec_VR, vec_VG, vec_VE, vec_VF, K_avg, quatV_pInfluence, quatA_pInfluence, quatV_next quatA_next, vec_rotVelocity] = III_reactions(S, T, gravity, velocityHit, jit, S_2, K, s, iit, minimumRestitution, KT, vec_O, F, dLdxS, dLdyS, R, mass, diameter, quatV_ground, quatA_ground, N)
%Reaction forces
%   Called by control.m
% Equal Reaction Vector
vec_VRfake = [(S(1)+(T)*velocityHit(2,1)) (S(2)+(T)*velocityHit(2,2)) (S(3)+(T)*velocityHit(2,3)); (S_2(1)-(S(1)+(T)*velocityHit(2,1))) (S_2(2)-(S(2)+(T)*velocityHit(2,2))) (S_2(3)-(S(3)+(T)*velocityHit(2,3)))];
vec_VR = [vec_VRfake(1,1) vec_VRfake(1,2) vec_VRfake(1,3); ((jit)*vec_mag(vec_VRfake))*cos(vec_alpha(vec_VRfake)) ((jit)*vec_mag(vec_VRfake))*cos(vec_beta(vec_VRfake)) ((jit)*vec_mag(vec_VRfake))*cos(vec_gamma(vec_VRfake))];

% Gravitational Reaction Vector
vec_VG = [S(1) S(2) S(3); 0 0 -T*0.01*gravity];

% Elasticity Reaction Vector
K_avg = ((K(S(1),S(2))+K(S_2(1),S_2(2)))/2);
KT_avg = ((KT(S(1),S(2))+KT(S_2(1),S_2(2)))/2);
% These calculations convert readable COR to usable COR
K_calc = 2*(0.84798087*(K_avg^3) - 1.6885521*(K_avg^2) + 1.41395526*(K_avg) + 0.48879599);
if K_avg <= minimumRestitution
    K_calc = 2*(-5208.3333*(K_avg^2) + 104.166666*(K_avg));
end;
if jit > 1
    vec_VE = [vec_VR(1,1)+vec_VR(2,1) vec_VR(1,2)+vec_VR(2,2) vec_VR(1,3)+vec_VR(2,3); -K_calc*KT_avg*(s{iit,jit-1}.velocityHit(2,1)+s{iit,jit-1}.vec_VR(2,1)) -K_calc*KT_avg*(s{iit,jit-1}.velocityHit(2,2)+s{iit,jit-1}.vec_VR(2,2)) -K_calc*KT_avg*(s{iit,jit-1}.velocityHit(2,3)+s{iit,jit-1}.vec_VR(2,3))];
else
    vec_VE = [vec_VR(1,1)+vec_VR(2,1) vec_VR(1,2)+vec_VR(2,2) vec_VR(1,3)+vec_VR(2,3); 0 0 0];
end;

% Frictional Reaction Vector
F_avg = ((F(S(1),S(2))+F(S_2(1),S_2(2)))/2);
vec_VF = [vec_O(1,1)+vec_O(2,1) vec_O(1,2)+vec_O(2,2) vec_O(1,3)+vec_O(2,3) ; -F_avg*vec_O(2,1) -F_avg*vec_O(2,2) -F_avg*vec_O(2,3)];

% Spin
quatV_pInfluence = [S(1) S(2) S(3); -(dLdyS)/(sqrt((dLdyS^2)+(dLdxS^2))) (dLdxS)/(sqrt((dLdyS^2)+(dLdxS^2))) 0];
R_avg = ((R(S(1),S(2))+R(S_2(1),S_2(2)))/2);
pJ = (T*R_avg*mass*(vec_mag(vec_VR)/T))/mass;
quatA_pInfluence = 2*pi*((-(vec_mag(vec_O))/(diameter/2))+(pJ/(diameter/2)));

[ap, bp, cp, dp] = quat_toQuat(quatV_pInfluence, quatA_pInfluence);
[ag, bg, cg, dg] = quat_toQuat(quatV_ground, quatA_ground);
[quatV_nextFake quatA_next] = quat_toVector(ap+ag, bp+bg, cp+cg, dp+dg, S(1), S(2), S(3));
quatV_next = vec_normalize(quatV_nextFake);

vec_rotVelocityFake = [S_2(1) S_2(2) S_2(3); -quatV_next(2,2) quatV_next(2,1) N(S_2(1)-quatV_next(2,2), S_2(2)+quatV_next(2,1))-S_2(3)];
vec_rotVelocity = [S_2(1) S_2(2) S_2(3); (diameter/2)*(quatA_next/(2*pi))*cos(vec_alpha(vec_rotVelocityFake)) (diameter/2)*(quatA_next/(2*pi))*cos(vec_beta(vec_rotVelocityFake)) (diameter/2)*(quatA_next/(2*pi))*cos(vec_gamma(vec_rotVelocityFake))];
end