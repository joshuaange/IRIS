display("Finding final derivative and time segment values");
% Acceleration and Velocity
% Derivative(s) of parametric equation at first impact time
dx2_idt = diff(x_i,2);
dy2_idt = diff(y_i,2);
dz2_idt = diff(z_i,2);
v_i = [C_i(1),C_i(2),C_i(3); dx_idt(t_f_i),dy_idt(t_f_i),dz_idt(t_f_i)];
a_i = [C_i(1),C_i(2),C_i(3); dx2_idt(t_f_i),dy2_idt(t_f_i),dz2_idt(t_f_i)];

% Rotation
% Finds ending spin from (assumed constant within atmosphere) angular velocity
I_i = [S_i(1),S_i(2),S_i(3); q_i(2,1) * t_f_i, q_i(2,2) * t_f_i, q_i(2,3) * t_f_i];
% Considerations for unit circle equivalencies in angle
while I_i(2,1) >= 2*pi
    I_i(2,1) = I_i(2,1) - 2*pi;
end
while I_i(2,2) >= 2*pi
    I_i(2,2) = I_i(2,2) - 2*pi;
end
while I_i(2,3) >= 2*pi
    I_i(2,3) = I_i(2,3) - 2*pi;
end
while I_i(2,1) <= -2*pi
    I_i(2,1) = I_i(2,1) + 2*pi;
end
while I_i(2,2) <= -2*pi
    I_i(2,2) = I_i(2,2) + 2*pi;
end
while I_i(2,3) <= -2*pi
    I_i(2,3) = I_i(2,3) + 2*pi;
end

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
I_ij = I_i;
a_ij = a_i;

display("final.m");