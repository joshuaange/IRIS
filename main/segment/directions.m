% Tangent Plane and Normal Vector
dNNdx = double(dLdx(S_ij(1),S_ij(2)));
dNNdy = double(dLdy(S_ij(1),S_ij(2)));
if dNNdx == 0
    dNNdx = derivative_min;
end
if dNNdy == 0
    dNNdy = derivative_min;
end
NN_ij = @(x,y) dNNdx*(x-S_ij(1))+dNNdy*(y-S_ij(2))+S_ij(3);
N_ij = [S_ij(1),S_ij(2),S_ij(3); -dNNdx,-dNNdy,1];

% Parallel Vector
PN_ij = v_ij(2,:)-((dot(v_ij(2,:),N_ij(2,:)))/((mag(N_ij))^2)).*N_ij(2,:);
P_ij = [S_ij(1),S_ij(2),S_ij(3); T*PN_ij(1),T*PN_ij(2),T*PN_ij(3)];
% Perpendicular Vector
B_m_ij = max(real(vpasolve((mag([S_ij(1)+P_ij(2,1),S_ij(2)+P_ij(2,2),S_ij(3)+P_ij(2,3); T*VAL*dNNdx,T*VAL*dNNdy,T*VAL*(-1)]))^2 + (mag(P_ij))^2 == (T*mag(v_ij))^2, VAL)));
if B_m_ij == 0
    B_m_ij = B_m_min;
end
B_ij = [S_ij(1)+P_ij(2,1),S_ij(2)+P_ij(2,2),S_ij(3)+P_ij(2,3); T*B_m_ij*dNNdx,T*B_m_ij*dNNdy,T*B_m_ij*(-1)];
% Magnitude to Surface
mGAP = abs(L(-M_range*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),-M_range*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - -M_range*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3));
M_ij = -M_range;
display("Magnitude Test 1:  " + double(-M_range) + " : 10000 : " + double(M_range));
for mVALone = -M_range:10000:M_range
    if abs(L(mVALone*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALone*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALone*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3))) < mGAP
        mGAP = abs(L(mVALone*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALone*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALone*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3)));
        M_ij = mVALone;
        display("Successful Movement 1:  " + M_ij + ", Movement Gap: " + double(mGAP));
    end
end
display("Magnitude Test 2:  " + double(M_ij-5000) + " : 1000 : " + double(M_ij+5000));
for mVALtwo = M_ij-5000:1000:M_ij+5000
    if abs(L(mVALtwo*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALtwo*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALtwo*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3))) < mGAP
        mGAP = abs(L(mVALtwo*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALtwo*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALtwo*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3)));
        M_ij = mVALtwo;
        display("Successful Movement 2:  " + M_ij + ", Movement Gap: " + double(mGAP));
    end
end
display("Magnitude Test 3:  " + double(M_ij-500) + " : 100 : " + double(M_ij+500));
for mVALthree = M_ij-500:100:M_ij+500
    if abs(L(mVALthree*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALthree*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALthree*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3))) < mGAP
        mGAP = abs(L(mVALthree*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALthree*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALthree*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3)));
        M_ij = mVALthree;
        display("Successful Movement 3:  " + M_ij + ", Movement Gap: " + double(mGAP));
    end
end
display("Magnitude Test 4:  " + double(M_ij-50) + " : 1 : " + double(M_ij+50));
for mVALfour = M_ij-50:1:M_ij+50
    if abs(L(mVALfour*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALfour*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALfour*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3))) < mGAP
        mGAP = abs(L(mVALfour*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALfour*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALfour*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3)));
        M_ij = mVALfour;
        display("Successful Movement 4:  " + M_ij + ", Movement Gap: " + double(mGAP));
    end
end
display("Magnitude Test 5:  " + double(M_ij-0.5) + " : " + double(M_step) + " : " + double(M_ij+0.5));
for mVALfive = M_ij-0.5:M_step:M_ij+0.5
    if abs(L(mVALfive*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALfive*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALfive*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3))) < mGAP
        mGAP = abs(L(mVALfive*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),mVALfive*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2)) - double(mVALfive*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3)));
        M_ij = mVALfive;
        display("Successful Movement 5:  " + M_ij + ", Movement Gap: " + double(mGAP));
    end
end

display("mGAP: " + double(mGAP));
display("M_ij: " + M_ij);

% Traced Path
Rn_ij = [M_ij*cos(falpha(B_ij))+P_ij(2,1)+S_ij(1),M_ij*cos(fbeta(B_ij))+P_ij(2,2)+S_ij(2),M_ij*cos(fgamma(B_ij))+P_ij(2,3)+S_ij(3)];
O_ij = [S_ij(1),S_ij(2),S_ij(3); Rn_ij(1)-S_ij(1),Rn_ij(2)-S_ij(2),L(Rn_ij(1),Rn_ij(2))-S_ij(3)];

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