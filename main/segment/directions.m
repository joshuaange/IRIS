% Tangent Plane and Normal Vector
NN_ij = @(x,y) dLdx(S_ij(1),S_ij(2))*(x-S_ij(1))+dLdy(S_ij(1),S_ij(2))*(y-S_ij(2))+S_ij(3);
N_ij = [S_ij(1),S_ij(2),S_ij(3); -dLdx(S_ij(1),S_ij(2)),-dLdy(S_ij(1),S_ij(2)),1];
dNNdx = matlabFunction(diff(NN_ij,x),'Vars',[x y]);
dNNdy = matlabFunction(diff(NN_ij,y),'Vars',[x y]);

% Parallel Vector
PN_ij = v_ij(2,:)-((dot(v_ij(2,:),N_ij(2,:)))/((mag(N_ij))^2)).*N_ij(2,:);
P_ij = [S_ij(1),S_ij(2),S_ij(3); T*PN_ij(1),T*PN_ij(2),T*PN_ij(3)];
% Perpendicular Vector
B_m_ij = max(vpasolve((mag([S_ij(1)+P_ij(2,1),S_ij(2)+P_ij(2,2),S_ij(3)+P_ij(2,3); T*VAL*dLdx(S_ij(1),S_ij(2)),T*VAL*dLdy(S_ij(1),S_ij(2)),T*VAL*(-1)]))^2 + (mag(P_ij))^2 == (T*mag(v_ij))^2, VAL));
if B_m_ij == 0
    B_m_ij = B_m_min;
end
B_ij = [S_ij(1)+P_ij(2,1),S_ij(2)+P_ij(2,2),S_ij(3)+P_ij(2,3); T*B_m_ij*dLdx(S_ij(1),S_ij(2)),T*B_m_ij*dLdy(S_ij(1),S_ij(2)),T*B_m_ij*(-1)];
% Magnitude to Surface
M_ij = vpasolve(L(VAL*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),VAL*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2))==VAL*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3), VAL, [-M_range M_range]);

% Traced Path
Rn_ij = [M_ij*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),M_ij*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2),M_ij*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3)];
O_ij = [S_ij(1),S_ij(2),S_ij(3); Rn_ij(1)-S_ij(1),Rn_ij(2)-S_ij(2),Rn_ij(3)-S_ij(3)];

%Number of time segments
if jit == 1 
    Kt_V = (mag(B_ij)/T);
    k_lin = (pi/3.21)^2 * (m*(k_H^4)*(Kt_V^2))^(1/5);
    T_HS = pi*sqrt(m/k_lin);
    Kt_i = (T_HS)/T;
    Kt_i = round(Kt_i);
    if Kt_i < 1
       Kt_i = 1; 
    end
    b{iit}.Kt_i = vpa(Kt_i);
    display("DURATION: " + double(Kt_i));
end



display("directions.m");