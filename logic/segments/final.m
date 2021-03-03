% New velocity
display("...New Velocity");
V_ij = [R_ij(1),R_ij(2),R_ij(3); A_g_ij(2,1) + A_n_ij(2,1) + A_e_ij(2,1) + A_f_ij(2,1) + A_r_ij(2,1) + v_ij(2,1),A_g_ij(2,2) + A_n_ij(2,2) + A_e_ij(2,2) + A_f_ij(2,2) + A_r_ij(2,2) + v_ij(2,2),A_g_ij(2,3) + A_n_ij(2,3) + A_e_ij(2,3) + A_f_ij(2,3) + A_r_ij(2,3) + v_ij(2,3)];

display("...Misc. Calculations");
% Forces
J_ij = m*mag([R_ij(1),R_ij(2),R_ij(3); V_ij(2,1)-v_ij(2,1),V_ij(2,2)-v_ij(2,2),V_ij(2,3)-v_ij(2,3)]);
FI_ij = -abs(J_ij/T);
% Deformation
sigma_l_ij = (Y_l(S_ij(1),S_ij(2))+Y_l(R_ij(1),R_ij(2)))/(2*(G_l(S_ij(1),S_ij(2))+G_l(R_ij(1),R_ij(2)))) - 1;
M_l_ij = (1-sigma_l_ij^2)/(pi*((Y_l(S_ij(1),S_ij(2))+Y_l(R_ij(1),R_ij(2)))/2));
D_ij = ((((3*pi)/2)^(2/3))*((101.97*abs(FI_ij))^(2/3))*((M_l_ij+M_p)^(2/3))*((1/(1000*d))^(1/3)))/(1000);
% Kinetic Energy
deltaKE_ij = 0.5*m*(mag(V_ij) - mag(v_ij))^2 + 0.5*I*(mag(Q_ij) - mag(q_ij))^2;
KE_f_ij = KE_s_ij + deltaKE_ij;

display("...Temperature");
% Temperature (Conductivity)
if D_ij==0
   h_f_ij = 0; 
else
   h_f_ij = ((T_c(S_ij(1),S_ij(2))+T_c(R_ij(1),R_ij(2)))/2)*((T_s_ij-((T_g(S_ij(1),S_ij(2))+T_g(R_ij(1),R_ij(2)))/2))/D_ij);
end
if T_s_ij==((T_g(S_ij(1),S_ij(2))+T_g(R_ij(1),R_ij(2)))/2)
    h_t_ij = 0;
else
    h_t_ij = (h_f_ij)/(T_s_ij-((T_g(S_ij(1),S_ij(2))+T_g(R_ij(1),R_ij(2)))/2));
end
SA_g_ij = pi*( (d/2)^2 * (d/2 - D_ij)^2 );
h_c_ij = h_t_ij * (SA_g_ij / h_C);

T_g_ij = ((T_g(S_ij(1),S_ij(2))+T_g(R_ij(1),R_ij(2)))/2);
if deltaKE_ij < 0
    T_g_ij = ((T_g(S_ij(1),S_ij(2))+T_g(R_ij(1),R_ij(2)))/2) - ((h_R*deltaKE_ij)/(1000*m))/h_C;
end

T_f_ij = T_g_ij+(T_s_ij-T_g_ij)*exp(-T*h_c_ij);

display("final.m");