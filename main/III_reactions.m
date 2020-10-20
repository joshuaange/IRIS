function [vec_VR, vec_VG, vec_VE, vec_VF, K_avg] = III_reactions(S, T, gravity, velocityHit, jit, S_2, K, s, iit, minimumRestitution, KT)
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
vec_VF = [S(1) S(2) S(3) ; 0 0 0];
end