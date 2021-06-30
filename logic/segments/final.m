% New velocity and acceleration
V_ij = [C_ij(1),C_ij(2),C_ij(3); v_ij(2,1) + (F_g_ij(2,1)+F_R_ij(2,1)+F_f_ij(2,1)+F_N_ij(2,1)+F_e_ij(2,1))/m * T, v_ij(2,2) + (F_g_ij(2,2)+F_R_ij(2,2)+F_f_ij(2,2)+F_N_ij(2,2)+F_e_ij(2,2))/m * T, v_ij(2,3) + (F_g_ij(2,3)+F_R_ij(2,3)+F_N_ij(2,3)+F_e_ij(2,3)+F_f_ij(2,3))/m * T];
A_ij = [C_ij(1),C_ij(2),C_ij(3); (V_ij(2,1) - v_ij(2,1))/T, (V_ij(2,2) - v_ij(2,2))/T, (V_ij(2,3) - v_ij(2,3))/T];

display("...Misc. Calculations");
% Impact Force is perpendicular of initial applied force
FI_ij = -mag(F_N_ij);
% Deformation - Elastic compression between a sphere and plane
% From https://emtoolbox.nist.gov/publications/nationalstandardslaboratorytechnicalpaperno25.pdf
sigma_l_ij = (Y_l(S_ij(1),S_ij(2))+Y_l(S_ij(1),S_ij(2)))/(2*(G_l(S_ij(1),S_ij(2))+G_l(S_ij(1),S_ij(2)))) - 1;
M_l_ij = (1-sigma_l_ij^2)/(pi*((Y_l(S_ij(1),S_ij(2))+Y_l(S_ij(1),S_ij(2)))/2));
D_ij = ((((3*pi)/2)^(2/3))*((101.97*abs(FI_ij))^(2/3))*((M_l_ij+M_p)^(2/3))*((1/(1000*d))^(1/3)))/(1000);

% Kinetic Energy % Change in linear energy + rotational
deltaKE_ij = 0.5*m*(mag(V_ij) - mag(v_ij))^2 + 0.5*I*(mag(Q_ij) - mag(q_ij))^2;
KE_f_ij = KE_s_ij + deltaKE_ij;

% Newton's Law of Cooling (Conductivity) - from https://www.omnicalculator.com/physics/newtons-law-of-cooling#:~:text=Newton's%20law%20of%20cooling%20formula,-The%20Newton's%20law&text=T%20%5BK%5D%20is%20the%20temperature,object%20at%20the%20time%20t%20%2C&text=T_initial%20%5BK%5D%20is%20the%20initial,the%20time%20of%20the%20cooling.
if D_ij==0 % Heat flux (Fourier's Law)
   h_f_ij = 0;
else
   h_f_ij = (T_c(S_ij(1),S_ij(2)))*(T_s_ij-T_g(S_ij(1),S_ij(2)))/D_ij;
end
if T_s_ij==(T_g(S_ij(1),S_ij(2))) % Heat transfer coefficient
    h_t_ij = 0;
else
    h_t_ij = (h_f_ij)/(T_s_ij-(T_g(S_ij(1),S_ij(2))));
end
SA_g_ij = 2*pi*(d/2)*D_ij; % Area of heat transfer (area of spherical cap)
h_c_ij = h_t_ij * (SA_g_ij / h_C); % Cooling coefficient
T_f_ij = (T_g(S_ij(1),S_ij(2))) + (T_s_ij - (T_g(S_ij(1),S_ij(2)))) * exp(- h_c_ij * T); % Final temperature conduction


% Temperature gained from kinetic energy (heat capacity) https://www.omnicalculator.com/physics/specific-heat
if deltaKE_ij < 0
    T_f_ij = T_f_ij + (m*((1/3 * pi * (D_ij)^2 * (3*(d/2) - D_ij))/(4/3 * pi * (d/2)^3)))*((h_R*deltaKE_ij)/(h_C*m)); % Adding temperature from shifting kinetic energy to ground
    % finds change in K by multiplying (ratio of volume * mass ) to
    % specific heat capacity in K/kg
end

display("final.m");