clc
clear all
close all
folder = pwd;
% Load Input .mat here
load(strcat(folder,'\main\inputs\Bouncing_One.mat'))

syms x y VAL t
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
Kt = ((d/((sqrt(9806.6501*Y_p))/(rho_p)))/T);
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
                q_i = vpa(Q_ij);
                T_i = vpa(T_f_ij);
                break
            elseif r>r_edge % In-Air (Edge)
                u_i = [vpa(Cn_ij(1)),vpa(Cn_ij(2)),vpa(Cn_ij(3)); vpa(V_ij(2,1)),vpa(V_ij(2,2)),vpa(V_ij(2,3))];
                q_i = vpa(Q_ij);
                T_i = vpa(T_f_ij);
                break
            else % On-Ground
                KE_s_ij = vpa(KE_f_ij);
                v_ij = vpa(V_ij);
                q_ij = vpa(Q_ij);
                C_ij = vpa(Cn_ij);
                T_s_ij = vpa(T_f_ij);
                S_ij = vpa(R_ij);
            end
        end
    if -v_min<double(mag(V_ij))<=v_min
        break
    end
end

%run(strcat(folder,'\out\main\main.m'));
%run(strcat(folder,'\out\kineticEnergy.m'));
%run(strcat(folder,'\out\deformation.m'));
%run(strcat(folder,'\out\reactions.m'));
run(strcat(folder,'\out\velocity.m'));

save(strcat(folder,'\main\outputs\Bouncing_One.mat'))

display("END");