clc
clear all
folder = pwd;
% Load Input .mat here
load(strcat(folder,'\main\inputs\Bullet_Projectile_Motion.mat'))

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
Kt = T/((d)/(sqrt((9806.6501*Y_p)/(rho_p))));
if Kt > 1
    Kt = 1;
end
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
                u_i = [vpa(Cn_ij(1)),vpa(Cn_ij(2)),vpa(Cn_ij(3)); vpa(V_ij(2,1)),vpa(V_ij(2,2)),vpa(V_ij(2,3))];
                qA_i = vpa(QA_ij);
                qB_i = vpa(QB_ij);
                qC_i = vpa(QC_ij);
                qD_i = vpa(QD_ij);
                qOmega_i = vpa(QOmega_ij);
                T_i = vpa(T_f_ij);
                break
            end
            % On-Ground
            if r<=r_min
                KE_s_ij = vpa(KE_f_ij);
                v_ij = vpa(V_ij);
                qA_ij = vpa(QA_ij);
                qB_ij = vpa(QB_ij);
                qC_ij = vpa(QC_ij);
                qD_ij = vpa(QD_ij);
                qOmega_ij = vpa(QOmega_ij);
                C_ij = vpa(Cn_ij);
                T_s_ij = vpa(T_f_ij);
                S_ij = vpa(R_ij);
            end
        end
    if -v_min<vpa(mag(V_ij))<=v_min
        break
    end
end

%run(strcat(folder,'\out\main\main.m'));

display("END");