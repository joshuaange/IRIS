clc
clear all
folder = pwd;
% Load Input .mat here
load(strcat(folder,'\main\inputs\test.mat'))

syms x y VAL t
b = cell(i_max,1);
s = cell(i_max,j_max);
% Initial
SA = (4*pi*(d/2)^2)/2;
Q = sqrt((2*m*g)/(rho*SA*C_d));
sigma_p = (Y_p/(2*G_p))-1;
M_p = (1-sigma_p^2)/(pi*Y_p);
[X_sphere,Y_sphere,Z_sphere] = sphere;
A_limit = size(X_sphere,1);
B_limit = size(Y_sphere,2);
Kt = (sqrt((9806.6501*Y_p)/(rho_p)))/36000;
% Partial Derivatives
dLdx = matlabFunction(diff(L,x),'Vars',[x y]);
dLdy = matlabFunction(diff(L,y),'Vars',[x y]);

for iit = 1:i_max
    % Trajectory
    run(strcat(folder,'\main\trajectory\trajectory.m'));
    run(strcat(folder,'\main\trajectory\pod.m'));
    run(strcat(folder,'\main\trajectory\final.m'));
    % Record
    run(strcat(folder,'\record\big.m'));
    display("[" + iit + "]");
        for jit = 1:j_max
            % Time Segments
            run(strcat(folder,'\main\segment\directions.m'));
            run(strcat(folder,'\main\segment\pod.m'));
            run(strcat(folder,'\main\segment\reactions.m'));
            run(strcat(folder,'\main\segment\final.m'));
            % Record
            run(strcat(folder,'\record\small.m'));
            display("[" + iit + " + " + jit + "]");

            % Return
            r = T*V_ij(2,3) + Cn_ij(3) - L(T*V_ij(2,1) + Cn_ij(1),T*V_ij(2,2) + Cn_ij(2));
            display("Return: " + double(r) + ", Velocity: " + double(mag(V_ij)));
            
            % Stop
            if -v_min<double(mag(V_ij))<=v_min
                break
            end
            % In-Air
            if r>r_min
                u_i = [double(Cn_ij(1)),double(Cn_ij(2)),double(Cn_ij(3)); double(V_ij(2,1)),double(V_ij(2,2)),double(V_ij(2,3))];
                qA_i = double(QA_ij);
                qB_i = double(QB_ij);
                qC_i = double(QC_ij);
                qD_i = double(QD_ij);
                qOmega_i = double(QOmega_ij);
                T_i = double(T_f_ij);
                break
            end
            % On-Ground
            if r<=r_min
                KE_s_ij = double(KE_f_ij);
                v_ij = double(V_ij);
                qA_ij = double(QA_ij);
                qB_ij = double(QB_ij);
                qC_ij = double(QC_ij);
                qD_ij = double(QD_ij);
                qOmega_ij = double(QOmega_ij);
                C_ij = double(Cn_ij);
                T_s_ij = double(T_f_ij);
                S_ij = double(R_ij);
            end
        end
    if -v_min<double(mag(V_ij))<=v_min
        break
    end
end

display("END");