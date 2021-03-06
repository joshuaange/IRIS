clc
clear all
close all
display("Reading input .mat file");
% Universal setups
global Xq Yq L_x L_y L_z F_x F_y F_z F_r_x F_r_y F_r_z K_x K_y K_z T_c_x T_c_y T_c_z G_l_x G_l_y G_l_z T_g_x T_g_y T_g_z Y_l_x Y_l_y Y_l_z Domain Bi_Int
syms x y VAL t x_i(t) y_i(t) z_i(t)
folder = pwd;
file = 'HighballTrial';
% Loading variable .mat
load(strcat(folder,'\data\inputs\',file,'\variables.mat'))
% Capturing and interpreting images defining surface characteristics
run(strcat(folder,'\logic\terrain.m'));

% Record Matrices
b = cell(i_max,1);
s = cell(i_max,j_max);
% Initial
C_d = 0.5; % Drag coefficient of pod is 0.5 for spherical objects
h_R = 0.90; % Percentage of lost kinetic energy transformed to heat (must be found experimentally, so assumed to be 75%)
A_s = (pi*(d/2)^2); % Cross-sectional area of sphere
g(x) = ((6.67430*10^-11)*((m*m_p)/((x)^2)))/m; % Finds gravity from distance to center of planet
Q(x) = sqrt((2*m*g(x))/(rho*A_s*C_d)); % Finds terminal velocity from distance to center of planet (https://www.grc.nasa.gov/www/k-12/airplane/termv.html)
sigma_p = (Y_p/(2*G_p))-1; % Poisson's Ratio (https://emtoolbox.nist.gov/publications/nationalstandardslaboratorytechnicalpaperno25.pdf)
M_p = (1-sigma_p^2)/(pi*Y_p); % Other Material Property (https://emtoolbox.nist.gov/publications/nationalstandardslaboratorytechnicalpaperno25.pdf)
% Parachute
if parachute == 1 
    C_d_o = 1.5; % Parachute drag coefficient is 1.75. With pod, we estimate it as 1.5
    q_i(2,1) = 0; % No initial spin with parachute
    q_i(2,2) = 0;
    q_i(2,3) = 0;
    Q_o(x) = sqrt((2*(m+m_o)*g(x))/(rho*A_o*C_d_o)); % Terminal velocity with parachute
end
% Pod and Interpolation Conditions
[Xq, Yq] = meshgrid(0:Bi_Int:1);
[X_sphere,Y_sphere,Z_sphere] = sphere(p_num);
A_limit = size(X_sphere,1);
B_limit = size(Y_sphere,2);

display("Beginning i loop");
for iit = 1:i_max
    display("Start: " + "[" + iit + "]");
    % Trajectory
    run(strcat(folder,'\logic\trajectory\trajectory.m')); % Forming trajectory from 0 to time below L_min
    run(strcat(folder,'\logic\trajectory\pod.m')); % Real collision point
    run(strcat(folder,'\logic\trajectory\final.m')); % Final values and setup
    % Record
    run(strcat(folder,'\logic\record\big.m'));
    display("Beginning j loop");
    for jit = 1:j_max
        display("Start: " + "[" + iit + " + " + jit + "]");
        % Time Segments
        run(strcat(folder,'\logic\segments\directions.m')); % Velocity, gravity, tangent/normals, and duration
        run(strcat(folder,'\logic\segments\reactions.m')); % Reactions along time segment
        run(strcat(folder,'\logic\segments\pod.m')); % Traced segment vector and tangential pod movement
        run(strcat(folder,'\logic\segments\final.m')); % Final values and setup
        % Survivability
        run(strcat(folder,'\logic\segments\survivability.m')); % Finding survivability with pod
        % Return
        r = Cn_ij(3) - L(Cn_ij(1),Cn_ij(2));
        % Record
        run(strcat(folder,'\logic\record\small.m'));
        % Stop
        if -v_min<double(mag(V_ij))<=v_min
            break
        end
        if r>(d/2+r_min) && jit>=Kt_i % In-Air
            u_i = [double(Cn_ij(1)),double(Cn_ij(2)),double(Cn_ij(3))-L_min; double(V_ij(2,1)),double(V_ij(2,2)),double(V_ij(2,3))];
            q_i = double(Q_ij);
            T_i = double(T_f_ij);
            break
        elseif r>(d/2+r_edge) % In-Air (Edge)
            u_i = [double(Cn_ij(1)),double(Cn_ij(2)),double(Cn_ij(3))-L_min; double(V_ij(2,1)),double(V_ij(2,2)),double(V_ij(2,3))];
            q_i = double(Q_ij);
            T_i = double(T_f_ij);
            break
        else % On-Ground
            KE_s_ij = vpa(KE_f_ij);
            v_ij = double(V_ij);
            a_ij = double(A_ij);
            q_ij = double(Q_ij);
            C_ij = double(Cn_ij);
            T_s_ij = double(T_f_ij);
            S_ij = [double(R_ij(1)),double(R_ij(2)),L(R_ij(1),R_ij(2))];
        end
        if jit == j_max
           break
        end
    end
    if -v_min<double(mag(V_ij))<=v_min
        break
    end
    if jit == j_max
           break
    end
end

display("Saving output .mat file");
save(strcat(folder,'\data\outputs\',file,'.mat'))

display("End");