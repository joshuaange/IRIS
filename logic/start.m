% clc
% clear all
% close all
% % Load Input .mat here
% display("Reading input .mat file");
% global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
% folder = pwd;
% file = 'Empty';
load(strcat(folder,'\data\inputs\',file,'.mat'))
syms x y VAL t x_i(t) y_i(t) z_i(t)

%run(strcat(folder,'\logic\terrain.m'));
display("Initializing general variables");
% Record Matrices
b = cell(i_max,1);
s = cell(i_max,j_max);
% Initial
C_d = 0.5; % Drag coefficient of pod (generally 0.5)
h_R = 0.75; % "Heat ratio" - amount of kinetic energy applied as heat
A_s = (pi*(d/2)^2); % Cross-sectional area of sphere
Q = sqrt((2*m*g)/(rho*A_s*C_d)); % Terminal velocity from https://www.grc.nasa.gov/www/k-12/airplane/termv.html
if Q > 10000000
    Q = 10000000;
end 
sigma_p = (Y_p/(2*G_p))-1; % Poisson's Ratio (https://emtoolbox.nist.gov/publications/nationalstandardslaboratorytechnicalpaperno25.pdf)
M_p = (1-sigma_p^2)/(pi*Y_p); % Other Calculated Material Property (https://emtoolbox.nist.gov/publications/nationalstandardslaboratorytechnicalpaperno25.pdf)
% Parachute
parachute = 0;
if parachute == 1 
    %C_d_o = 1.5; % Parachute drag coefficient is 1.75. With pod, we estimate it as 1.5
    q_i(2,1) = 0; % No initial spin with parachute
    q_i(2,2) = 0;
    q_i(2,3) = 0;
    Q_o = sqrt((2*(m+m_o)*g)/(rho*(A_o)*C_d_o)); % Terminal velocity with parachute
    if Q_o > 10000000
        Q_o = 10000000;
    end
end
% Pod Conditions
[Xq, Yq] = meshgrid(0:Bi_Int:1);
[X_sphere,Y_sphere,Z_sphere] = sphere;
A_limit = size(X_sphere,1);
B_limit = size(Y_sphere,2);

display("Beginning i loop");
for iit = 1:i_max
    display("Start: " + "[" + iit + "]");
    % Trajectory
    run(strcat(folder,'\logic\trajectory\trajectory.m')); % Trajectory and impact
    run(strcat(folder,'\logic\trajectory\pod.m')); % Real collision point
    run(strcat(folder,'\logic\trajectory\final.m')); % Final values and setup
    % Record
    run(strcat(folder,'\logic\record\big.m'));
    display("Beginning j loop");
    for jit = 1:j_max
        display("Start: " + "[" + iit + " + " + jit + "]");
        % Time Segments
        run(strcat(folder,'\logic\segments\directions.m')); % Planes, vectors, and full duration
        run(strcat(folder,'\logic\segments\pod.m')); % Moves pod to ending position along traced segment vector
        run(strcat(folder,'\logic\segments\reactions.m')); % Reactions along time segment
        run(strcat(folder,'\logic\segments\final.m')); % Final values and setup
        % Survivability
        run(strcat(folder,'\logic\segments\survivability.m')); % Finding survivability with pod
        % Record
        run(strcat(folder,'\logic\record\small.m'));
        % Return
        r = V_ij(2,3) + Cn_ij(3) - L(V_ij(2,1) + Cn_ij(1),V_ij(2,2) + Cn_ij(2));
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
save(strcat(folder,'\data\outputs\',file,'.mat'))

display("End");