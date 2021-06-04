% Traced segment vector
O_ij = [C_ij(1),C_ij(2),C_ij(3); v_ij(2,1)*T + 0.5*(F_g_ij(2,1)+F_f_ij(2,1)+F_N_ij(2,1)+F_e_ij(2,1))/m * T^2, v_ij(2,2)*T + 0.5*(F_g_ij(2,2)+F_f_ij(2,2)+F_N_ij(2,2)+F_e_ij(2,2))/m * T^2, v_ij(2,3)*T + 0.5*(F_g_ij(2,3)+F_N_ij(2,3)+F_e_ij(2,3)+F_f_ij(2,3))/m * T^2];

% Directly translated pod coordinates to head of traced segment vector (O_ij)
Xn_ij = X_sphere*(d/2) + double(C_ij(1)+O_ij(2,1));
Yn_ij = Y_sphere*(d/2) + double(C_ij(2)+O_ij(2,2));
Zn_ij = Z_sphere*(d/2) + double(C_ij(3)+O_ij(2,3));
Cn_ij = C_ij + O_ij;

% IF BELOW TERRAIN
if Cn_ij(3) < L(Cn_ij(1),Cn_ij(2))
    R_ij = [Cn_ij(1),Cn_ij(2),L(Cn_ij(1),Cn_ij(2))];
        % Moving the pod up the normal vector as to not be intersectionary with
    % terrain (simple tangential to surface)
    dRdx = double(dLdx(R_ij(1),R_ij(2))); % Derivative values of ending position
    dRdy = double(dLdy(R_ij(1),R_ij(2)));
    if dRdx == 0
        dRdx = derivative_min;
    end
    if dRdy == 0
        dRdy = derivative_min;
    end
    Nn_ij = [R_ij(1),R_ij(2),R_ij(3); -dRdx,-dRdy,1]; % Normal vector of ending position

    Xn_ij = X_sphere*(d/2)+R_ij(1)+(d/2)*cos(falpha(Nn_ij)); % Final pod positions
    Yn_ij = Y_sphere*(d/2)+R_ij(2)+(d/2)*cos(fbeta(Nn_ij));
    Zn_ij = Z_sphere*(d/2)+R_ij(3)+(d/2)*cos(fgamma(Nn_ij));
    Cn_ij = [R_ij(1)+(d/2)*cos(falpha(Nn_ij)),R_ij(2)+(d/2)*cos(fbeta(Nn_ij)),R_ij(3)+(d/2)*cos(fgamma(Nn_ij))];
end

try
    % ON THE LINE
    % Find averaged ending point of translated pod coordinates (similar to
    % trajectory/pod.m)
    X_total = 0;
    Y_total = 0;
    Z_total = 0;
    c = 0;
    for m_A = 1:A_limit
        for m_B = 1:B_limit
            display("s_min comparison: " + double(abs(L(Xn_ij(m_A,m_B),Yn_ij(m_A,m_B))-Zn_ij(m_A,m_B))) + " (" + m_A + ", " + m_B + ")");
            if abs(L(Xn_ij(m_A,m_B),Yn_ij(m_A,m_B))-Zn_ij(m_A,m_B))<s_min
                display("Success(!) at (" + m_A + ", " + m_B + ")");
                c = c+1;
                X_total = X_total+Xn_ij(m_A,m_B);
                Y_total = Y_total+Yn_ij(m_A,m_B);
                Z_total = Z_total+Zn_ij(m_A,m_B);
            end
        end
    end
    % Impact
    R_ij = [(X_total/c),(Y_total/c),(Z_total/c)];
    
    % Moving the pod up the normal vector as to not be intersectionary with
    % terrain (simple tangential to surface)
    dRdx = double(dLdx(R_ij(1),R_ij(2))); % Derivative values of ending position
    dRdy = double(dLdy(R_ij(1),R_ij(2)));
    if dRdx == 0
        dRdx = derivative_min;
    end
    if dRdy == 0
        dRdy = derivative_min;
    end
    Nn_ij = [R_ij(1),R_ij(2),R_ij(3); -dRdx,-dRdy,1]; % Normal vector of ending position

    Xn_ij = X_sphere*(d/2)+R_ij(1)+(d/2)*cos(falpha(Nn_ij)); % Final pod positions
    Yn_ij = Y_sphere*(d/2)+R_ij(2)+(d/2)*cos(fbeta(Nn_ij));
    Zn_ij = Z_sphere*(d/2)+R_ij(3)+(d/2)*cos(fgamma(Nn_ij));
    Cn_ij = [R_ij(1)+(d/2)*cos(falpha(Nn_ij)),R_ij(2)+(d/2)*cos(fbeta(Nn_ij)),R_ij(3)+(d/2)*cos(fgamma(Nn_ij))];
catch
end

% Final movement of pod with this vector
O_ij = [C_ij(1),C_ij(2),C_ij(3); Cn_ij(1)-C_ij(1),Cn_ij(2)-C_ij(2),Cn_ij(3)-C_ij(3)];

display("pod.m");