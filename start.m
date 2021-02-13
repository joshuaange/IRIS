clc
clear all
close all
folder = pwd;
file = 'Ping_Pong_Ball_One';
% Load Input .mat here
syms x y VAL t L(x,y) dLdx(x,y) dLdy(x,y)
load(strcat(folder,'\main\inputs\',file,'.mat'))

b = cell(i_max,1);
s = cell(i_max,j_max);
% Initial
SA = (pi*(d/2)^2);
Q = sqrt((2*m*g)/(rho*SA*C_d));
sigma_p = (Y_p/(2*G_p))-1;
M_p = (1-sigma_p^2)/(pi*Y_p);
[X_sphere,Y_sphere,Z_sphere] = sphere;
A_limit = size(X_sphere,1);
B_limit = size(Y_sphere,2);
% Partial Derivatives
dLdx(x,y) = diff(L(x,y),x);
dLdy(x,y) = diff(L(x,y),y);

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
            
            % Pod Survivability
            aa = (T_s_ij-273.15)/(T_max-273.15);
            aaa = (T_f_ij-273.15)/(T_max-273.15);
            bb = abs(T_f_ij-T_s_ij)/deltaT;
            dd = (FI_ij/(SA_g_ij))/E_l;
            ee = (((FI_ij/(SA_g_ij^2))/1000000)*(sqrt(SA_g_ij)))/K_c;
            ff = (FI_ij/SA_g_ij)/FI_max;
            gg = (FI_ij/(SA_g_ij))/F_tu;
            S_pod = [aa,aaa,bb,dd,ee,ff,gg];
            S_pod_ij = max(double(real(S_pod)));
            % Contents Survivability 
            hh = (FI_ij/SA_g_ij)/FI_max_c;
            ii = (abs(D_ij))/d_shell;
            jj = (T_s_ij-273.15)/(T_max_c-273.15);
            jjj = (T_f_ij-273.15)/(T_max_c-273.15);
            kk = mag(Q_ij)/omega_max_c;
            S_contents = [hh,ii,jj,jjj,kk];
            S_contents_ij = max(double(real(S_contents)));
            
            % Record
            run(strcat(folder,'\record\small.m'));
            display("[" + iit + " + " + jit + "]");

            % Return
            r = t_step*V_ij(2,3) + Cn_ij(3) - L(t_step*V_ij(2,1) + Cn_ij(1),t_step*V_ij(2,2) + Cn_ij(2));
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

save(strcat(folder,'\main\outputs\',file,'.mat'))
save(strcat(folder,'\record\export.m'))

run(strcat(folder,'\out\main\main.m'));
run(strcat(folder,'\out\kineticEnergy.m'));
run(strcat(folder,'\out\deformation.m'));
run(strcat(folder,'\out\reactions.m'));
run(strcat(folder,'\out\velocity.m'));
run(strcat(folder,'\out\temperature.m'));
run(strcat(folder,'\out\spin.m'));
run(strcat(folder,'\out\survivability.m'));

display("END");