clc
clear all
close all
% Load Input .mat here
display("Reading input .mat file");
folder = pwd;
file = 'PTHeight_CraterTest';
load(strcat(folder,'\data\inputs\',file,'.mat'))
syms x y VAL t x_i(t) y_i(t) z_i(t)
global L_x L_y L_z L_domain Bi_Int

display("Initializing general variables");
% Heightmap Reading
L_z = double((imread('Surface.png')))*L_range/255;
L_x = 0:(L_domain/size(L_z,2)):(L_domain-(L_domain/size(L_z,2)));
L_y = 0:(L_domain/size(L_z,1)):(L_domain-(L_domain/size(L_z,1)));
% Record Matrices
C_d = 0.5;
h_R = 0.75;
b = cell(i_max,1);
s = cell(i_max,j_max);
% Initial
A_s = (pi*(d/2)^2);
Q_o = sqrt((2*(m+m_o)*g)/(rho*(A_o+A_s)*C_d_o));
if Q_o > 10000000
    Q_o = 10000000;
end
Q = sqrt((2*m*g)/(rho*A_s*C_d));
if Q > 10000000
    Q = 10000000;
end
sigma_p = (Y_p/(2*G_p))-1;
M_p = (1-sigma_p^2)/(pi*Y_p);
% Pod Conditions
[X_sphere,Y_sphere,Z_sphere] = sphere;
A_limit = size(X_sphere,1);
B_limit = size(Y_sphere,2);

display("Beginning i loop");
for iit = 1:i_max
    display("Start: " + "[" + iit + "]");
    % Trajectory
    run(strcat(folder,'\logic\trajectory\trajectory.m'));
    run(strcat(folder,'\logic\trajectory\pod.m'));
    run(strcat(folder,'\logic\trajectory\final.m'));
    % Record
    run(strcat(folder,'\logic\record\big.m'));
    display("Beginning j loop");
    for jit = 1:j_max
        display("Start: " + "[" + iit + " + " + jit + "]");
        % Time Segments
        run(strcat(folder,'\logic\segments\directions.m'));
        run(strcat(folder,'\logic\segments\pod.m'));
        run(strcat(folder,'\logic\segments\reactions.m'));
        run(strcat(folder,'\logic\segments\final.m'));
        % Survivability
        run(strcat(folder,'\logic\segments\survivability.m'));
        % Record
        run(strcat(folder,'\logic\record\small.m'));
        % Return
        r = T*V_ij(2,3) + Cn_ij(3) - L(T*V_ij(2,1) + Cn_ij(1),T*V_ij(2,2) + Cn_ij(2));
        display("Return: " + double(r) + ", Velocity: " + double(mag(V_ij)));
        % Stop
        if -v_min<double(mag(V_ij))<=v_min
            break
        end
        if r>r_min && jit>=Kt_i % In-Air
            u_i = [double(Cn_ij(1)),double(Cn_ij(2)),double(Cn_ij(3)); double(V_ij(2,1)),double(V_ij(2,2)),double(V_ij(2,3))];
            q_i = double(Q_ij);
            T_i = double(T_f_ij);
            break
        elseif r>r_edge % In-Air (Edge)
            u_i = [double(Cn_ij(1)),double(Cn_ij(2)),double(Cn_ij(3)); double(V_ij(2,1)),double(V_ij(2,2)),double(V_ij(2,3))];
            q_i = double(Q_ij);
            T_i = double(T_f_ij);
            break
        else % On-Ground
            KE_s_ij = vpa(KE_f_ij);
            v_ij = double(V_ij);
            q_ij = double(Q_ij);
            C_ij = double(Cn_ij);
            T_s_ij = double(T_f_ij);
            S_ij = double(R_ij);
        end
    end
    if -v_min<double(mag(V_ij))<=v_min
        break
    end
end

display("Saving output .mat file");
%save(strcat(folder,'\data\outputs\',file,'.mat'))

display("End");