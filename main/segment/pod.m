% Directly translated pod coordinates
xn_ij = X_sphere*(d/2)+C_ij(1)+O_ij(2,1);
yn_ij = Y_sphere*(d/2)+C_ij(2)+O_ij(2,2);
zn_ij = Z_sphere*(d/2)+C_ij(3)+O_ij(2,3);

% Find averaged ending point
X_total = 0;
Y_total = 0;
Z_total = 0;
c = 0;
for m_A = 1:A_limit
    for m_B = 1:B_limit
        if abs(L(xn_ij(m_A,m_B),yn_ij(m_A,m_B))-zn_ij(m_A,m_B))<s_min
            c = c+1;
            X_total = X_total+xn_ij(m_A,m_B);
            Y_total = Y_total+yn_ij(m_A,m_B);
            Z_total = Z_total+zn_ij(m_A,m_B);
        end
    end
end
% Impact
R_ij = [(X_total/c),(Y_total/c),(Z_total/c)];

% Moving the pod up the normal vector
Nn_ij = [R_ij(1),R_ij(2),R_ij(3); -dLdx(R_ij(1),R_ij(2)),-dLdy(R_ij(1),R_ij(2)),1];
Xn_ij = X_sphere*(d/2)+R_ij(1)+(d/2)*cos(falpha(Nn_ij));
Yn_ij = Y_sphere*(d/2)+R_ij(2)+(d/2)*cos(fbeta(Nn_ij));
Zn_ij = Z_sphere*(d/2)+R_ij(3)+(d/2)*cos(fgamma(Nn_ij));
Cn_ij = [R_ij(1)+(d/2)*cos(falpha(Nn_ij)),R_ij(2)+(d/2)*cos(fbeta(Nn_ij)),R_ij(3)+(d/2)*cos(fgamma(Nn_ij))];

display("pod.m");