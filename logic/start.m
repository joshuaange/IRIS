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

q_i(2,2) = -100000;
T=0.05;
j_max = 10;

display("Initializing general variables");
% Heightmap Reading
L_z = double((imread('Surface.png')))*L_range/255;
L_x = 0:(L_domain/size(L_z,2)):(L_domain-(L_domain/size(L_z,2)));
L_y = 0:(L_domain/size(L_z,1)):(L_domain-(L_domain/size(L_z,1)));
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
        run(strcat(folder,'\logic\segments\final.m')); % 
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