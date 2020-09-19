% Equal Reaction Vector
v_VR = [(S(1)+T*v_Vi(2,1)) (S(2)+T*v_Vi(2,2)) (S(3)+T*v_Vi(2,3)); (S_2(1)-(S(1)+T*v_Vi(2,1))) (S_2(2)-(S(2)+T*v_Vi(2,2))) (S_2(3)-(S(3)+T*v_Vi(2,3)))];
% Gravitational Reaction Vector
v_VG = [S(1) S(2) S(3); 0 0 -T*m*g];
% Elasticity Reaction Vector
v_VRmag  = sqrt((v_VR(2,1))^2+(v_VR(2,2))^2+(v_VR(2,3))^2);
alpha_v_VR = acos(v_VR(2,1)/v_VRmag);
beta_v_VR = acos(v_VR(2,2)/v_VRmag);
gamma_v_VR = acos(v_VR(2,3)/v_VRmag);
v_Vimag  = sqrt((v_Vi(2,1))^2+(v_Vi(2,2))^2+(v_Vi(2,3))^2);
K_avg = (K(S(1),S(2))+K(S_2(1),S_2(2)))/2;
DV = (T*K_avg*(v_Vimag))/m;
v_VE = [S_2(1) S_2(2) S_2(3); DV*cos(alpha_v_VR) DV*cos(beta_v_VR) DV*cos(gamma_v_VR)];
%   Frictional Reaction Vector
v_BG = [S(1) S(2) S(3); T*m*g*dLdxS T*m*g*dLdyS -T*m*g];
% v_BG = sqrt((v_VR(2,1))^2+(v_VR(2,2))^2+(v_VR(2,3))^2);
F_avg = (F(S(1),S(2))+F(S_2(1),S_2(2)))/2;
v_Omag = sqrt((v_O(2,1))^2+(v_O(2,2))^2+(v_O(2,3))^2);
% FJ = (T*F_avg*m*(v_BG/T))/m;
FJ = sqrt((F_avg*(v_VR(2,1)+v_VE(2,1)+v_BG(2,1)))^2+(F_avg*(v_VR(2,2)+v_VE(2,2)+v_BG(2,2)))^2+(F_avg*(v_VR(2,3)+v_VE(2,3)+v_BG(2,3)))^2);
if v_Omag == 0 
	v_VF = [S_2(1) S_2(2) S_2(3); 0 0 0];
else
	v_VF = [S_2(1) S_2(2) S_2(3); (FJ*((S(1)-S_2(1))/v_Omag)) (FJ*((S(2)-S_2(2))/v_Omag)) ((S(3)-S_2(3))/v_Omag)];
end;