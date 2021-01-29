% clc
% clear all
% close all
% folder = pwd;
% % Load Input .mat here
% load(strcat(folder,'\main\inputs\Bullet_Projectile_Motion.mat'))
t_step = 0.5;
L = @(x,y) 0.000001*x + 0.000001*y;
T=0.25;
domainMin=0;
domainMax=7;
K = @(x,y) 0*x + 0*y + 1;
%F = @(x,y) 0*x + 0*y + 1;
r_min = 0.0316;
j_max = 25;
i_max = 2;
r_edge = 5;
B_m_min = 0.00000001;

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
% Kt = ((d/((sqrt(9806.6501*Y_p))/(rho_p)))/T);
Kt = ((d/(d/2))/T);
if Kt < 1
   Kt = 1; 
end
Kt = round(Kt);
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
            
            if r>r_min && jit>=Kt % In-Air
                u_i = [vpa(Cn_ij(1)),vpa(Cn_ij(2)),vpa(Cn_ij(3)); vpa(V_ij(2,1)),vpa(V_ij(2,2)),vpa(V_ij(2,3))];
                qA_i = vpa(QA_ij);
                qB_i = vpa(QB_ij);
                qC_i = vpa(QC_ij);
                qD_i = vpa(QD_ij);
                qOmega_i = vpa(QOmega_ij);
                T_i = vpa(T_f_ij);
                break
            elseif r>r_edge % In-Air (Edge)
                u_i = [vpa(Cn_ij(1)),vpa(Cn_ij(2)),vpa(Cn_ij(3)); vpa(V_ij(2,1)),vpa(V_ij(2,2)),vpa(V_ij(2,3))];
                qA_i = vpa(QA_ij);
                qB_i = vpa(QB_ij);
                qC_i = vpa(QC_ij);
                qD_i = vpa(QD_ij);
                qOmega_i = vpa(QOmega_ij);
                T_i = vpa(T_f_ij);
                break
            else % On-Ground
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
    if -v_min<double(mag(V_ij))<=v_min
        break
    end
end

run(strcat(folder,'\out\main\main.m'));
%run(strcat(folder,'\out\kineticEnergy.m'));
display(double(b{2}.u_i))

display("END");