clc
clear all
% Add inputs variable workspace
load('empty.mat');

% Initial
SA = (4*pi*(d/2)^2)/2;
Q = sqrt((2*m*g)/(rho*SA*C_d));
sigma_p = (Y_p/(2*G_p))-1;
M_p = (1-sigma_p^2)/(pi*Y_p);
[X_sphere,Y_sphere,Z_sphere] = sphere;
A_limit = size(X_sphere,1);
B_limit = size(Y_sphere,2);
Kt = (sqrt((1019716212.97793*Y_p)/(rho_p*10^-4)))/36000;
% Partial Derivatives
dLdx = matlabFunction(diff(L,x),'Vars',[x y]);
dLdy = matlabFunction(diff(L,y),'Vars',[x y]);

for iit = 1:i_max
    % Trajectory
    run('trajectory');
    run('pod');
    run('final');
    % Record
    run('big');
        for jit = 1:j_max
            % Time Segments
            run('directions');
            run('pod');
            run('reactions');
            run('final');
            % Record
            run('small');

            % Return
            r = T*V_ij(2,3) + Cn_ij(3) - L(T*V_ij(2,1) + Cn_ij(1),T*V_ij(2,2) + Cn_ij(2));

            % Stop
            if -v_min<mag(V_ij)<=v_min
                break;
            end
            % In-Air
            if r>r_min
                u_i = [Cn_ij(1),Cn_ij(2),Cn_ij(3); V_ij(2,1),V_ij(2,2),V_ij(2,3)];
                qA_i = QA_ij;
                qB_i = QB_ij;
                qC_i = QC_ij;
                qD_i = QD_ij;
                qOmega_i = QOmega_ij;
                T_i = T_f_ij;
                break
            end
            % On-Ground
            if r<=r_min
                KE_s_ij = KE_f_ij;
                v_ij = V_ij;
                qA_ij = QA_ij;
                qB_ij = QB_ij;
                qC_ij = QC_ij;
                qD_ij = QD_ij;
                qOmega_ij = QOmega_ij;
                C_ij = Cn_ij;
                T_s_ij = T_f_ij;
                S_ij = R_ij;
            end
        end
    if -v_min<mag(V_ij)<=v_min
        break
    end
end

display("END");