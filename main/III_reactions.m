function [vec_Norm, W, vec_VR, vec_VG, vec_VF, quatV_pInfluence, quatA_pInfluence, quatV_next, quatA_next, vec_rotVelocity] = III_reactions(S, T, gravity, velocityHit, jit, S_new, K, s, iit, minimumRestitution, KT, vec_O, F, dLdxS, dLdyS, R, mass, diameter, quatV_ground, quatA_ground, N, U, vec_N_new, L, mag, vec_P, minimumFlatness, vec_B)
%Reaction forces
%   Called by control.m

% Gravity
W = mass*gravity;
vec_VG = [S(1) S(2) S(3); 0 0 -W*T];

% Equal Reaction Vector
%vec_VRfake = [(S(1)+(T)*velocityHit(2,1)) (S(2)+(T)*velocityHit(2,2)) (S(3)+(T)*velocityHit(2,3)); (S_new(1)-(S(1)+(T)*velocityHit(2,1))) (S_new(2)-(S(2)+(T)*velocityHit(2,2))) (S_new(3)-(S(3)+(T)*velocityHit(2,3)))];
%vec_VR = [vec_VRfake(1,1) vec_VRfake(1,2) vec_VRfake(1,3); ((jit)*vec_mag(vec_VRfake))*cos(vec_alpha(vec_VRfake)) ((jit)*vec_mag(vec_VRfake))*cos(vec_beta(vec_VRfake)) ((jit)*vec_mag(vec_VRfake))*cos(vec_gamma(vec_VRfake))];
%vec_VR = [velocityHit(1,1)+T*velocityHit(2,1) velocityHit(1,2)+T*velocityHit(2,2) velocityHit(1,3)+T*velocityHit(2,3); T*mag*cos(vec_alpha(vec_B)) T*mag*cos(vec_beta(vec_B)) T*mag*cos(vec_gamma(vec_B))];
vec_VR = [(S(1) + vec_P(2,1)) (S(2) + vec_P(2,2)) (S(3) + vec_P(2,3)); mag*cos(vec_alpha(vec_B)) mag*cos(vec_beta(vec_B)) mag*cos(vec_gamma(vec_B))];

% Normal Vector (Gravity)
vec_N_new_tangent = vec_normalize(vec_N_new);
theta = acos((((U(2,1))*(vec_N_new_tangent(2,1)))+((U(2,2))*(vec_N_new_tangent(2,2)))+((U(2,3))*(vec_N_new_tangent(2,3))))/(vec_mag(U)*vec_mag(vec_N_new_tangent)));
%vec_VG = [S(1) S(2) S(3); W*cos(vec_alpha(vec_O)) W*cos(vec_beta(vec_O)) W*cos(vec_gamma(vec_O))];
%vec_VG = [S(1) S(2) S(3); W*cos(vec_alpha(vec_O)) W*cos(vec_beta(vec_O)) L(S(1)+W*cos(vec_alpha(vec_O)),S(2)+W*cos(vec_beta(vec_O)))];
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
Norm = vec_mag(vec_VG_theta);
vec_Norm = [S(1) S(2) S(3); vec_VG_theta(2,1) vec_VG_theta(2,2) vec_VG_theta(2,3)];

% Frictional Reaction Vector
F_avg = ((F(S(1),S(2))+F(S_new(1),S_new(2)))/2);
%vec_VF = [vec_O(1,1)+vec_O(2,1) vec_O(1,2)+vec_O(2,2) vec_O(1,3)+vec_O(2,3) ; T*(-F_avg*vec_mag(vec_O))*cos(vec_alpha(vec_O)) T*(-F_avg*vec_mag(vec_O))*cos(vec_beta(vec_O)) T*(-F_avg*vec_mag(vec_O))*cos(vec_gamma(vec_O))];
vec_VF = [vec_O(1,1)+vec_O(2,1) vec_O(1,2)+vec_O(2,2) vec_O(1,3)+vec_O(2,3) ; ((-F_avg*vec_mag(vec_Norm)*cos(vec_alpha(vec_O)))) ((-F_avg*vec_mag(vec_Norm)*cos(vec_beta(vec_O)))) ((-F_avg*vec_mag(vec_Norm)*cos(vec_gamma(vec_O))))];

% Spin
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
