% Velocity
dx_idt = matlabFunction(diff(x_i(t)),'Vars',t);
dy_idt = matlabFunction(diff(y_i(t)),'Vars',t);
dz_idt = matlabFunction(diff(z_i(t)),'Vars',t);
v_i = [S_i(1),S_i(2),S_i(3); dx_idt(t_f_i),dy_idt(t_f_i),dz_idt(t_f_i)];

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

display("final.m");