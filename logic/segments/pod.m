% Directly translated pod coordinates to head of traced segment vector (O_ij)
xn_ij = X_sphere*(d/2) + double(C_ij(1)+O_ij(2,1));
yn_ij = Y_sphere*(d/2) + double(C_ij(2)+O_ij(2,2));
zn_ij = Z_sphere*(d/2) + double(C_ij(3)+O_ij(2,3));

% Find averaged ending point of translated pod coordinates (similar to
% trajectory/pod.m)
X_total = 0;
Y_total = 0;
Z_total = 0;
c = 0;
for m_A = 1:A_limit
    for m_B = 1:B_limit
        display("s_min comparison: " + double(abs(L(xn_ij(m_A,m_B),yn_ij(m_A,m_B))-zn_ij(m_A,m_B))) + " (" + m_A + ", " + m_B + ")");
        if abs(L(xn_ij(m_A,m_B),yn_ij(m_A,m_B))-zn_ij(m_A,m_B))<s_min
            display("Success(!) at (" + m_A + ", " + m_B + ")");
            c = c+1;
            X_total = X_total+xn_ij(m_A,m_B);
            Y_total = Y_total+yn_ij(m_A,m_B);
            Z_total = Z_total+zn_ij(m_A,m_B);
        end
    end
end
if c == 0
    display("! ! ! Ending point of pod isn't on terrain ! ! !");
    pause
end
% Impact
R_ij = [(X_total/c),(Y_total/c),L((X_total/c),(Y_total/c))];
O_ij = [S_ij(1),S_ij(2),S_ij(3); R_ij(1)-S_ij(1),R_ij(2)-S_ij(2),L(R_ij(1),R_ij(2))-S_ij(3)];

display("Moving the pod across the normal vector...");
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

display("pod.m");