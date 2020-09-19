% New Velocity
newvelocity_x = v_Vi(2,1) + (v_VR(2,1)/T) + v_VF(2,1) + v_VG(2,1) + v_VE(2,1);
newvelocity_y = v_Vi(2,2) + (v_VR(2,2)/T) + v_VF(2,2) + v_VG(2,2) + v_VE(2,2);
newvelocity_z = v_Vi(2,3) + (v_VR(2,3)/T) + v_VF(2,3) + v_VG(2,3) + v_VE(2,3);
v_Vi_2 = [S_2(1) S_2(2) S_2(3); newvelocity_x newvelocity_y newvelocity_z];
% Force of Impact
v_Vi_2mag  = sqrt((v_Vi_2(2,1))^2+(v_Vi_2(2,2))^2+(v_Vi_2(2,3))^2);
FI = m*((v_Vi_2mag - v_Vimag)/T);
% Kinetic Interest
deltalKE=0.5*m*(v_Vi_2mag^2 - v_Vimag^2);
deltaKE = deltalKE;
% Deformation
Y_avg = (Y(S(1),S(2))+Y(S_2(1),S_2(2)))/2;
G_avg = (G(S(1),S(2))+G(S_2(1),S_2(2)))/2;
sigma_l = (Y_avg)/(2*G_avg-1);
mat_l = (1-sigma_l^2)/(pi*Y_avg);
deformation = ((((3*pi/2)^2/3)*(101.97*(-FI))^2/3*(mat_l+mat_p)^2/3*(1/(1000*D)))^1/3)/1000;