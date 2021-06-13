display("Finding final derivative and time segment values");
% Acceleration and Velocity
% Derivative(s) of parametric equation at first impact time
dx2_idt = diff(x_i,2);
dy2_idt = diff(y_i,2);
dz2_idt = diff(z_i,2);
v_i = [C_i(1),C_i(2),C_i(3); dx_idt(t_f_i),dy_idt(t_f_i),dz_idt(t_f_i)];
a_i = [C_i(1),C_i(2),C_i(3); dx2_idt(t_f_i),dy2_idt(t_f_i),dz2_idt(t_f_i)];

% Kinetic Energy
KE_s_i = 0.5*m*mag(u_i)^2;
KE_f_i = 0.5*m*mag(v_i)^2;

% Prep for Time Segment
KE_s_ij = KE_f_i;
q_ij = q_i;
S_ij = S_i;
v_ij = v_i;
C_ij = C_i;
T_s_ij = T_i;
a_ij = a_i;

display("final.m");