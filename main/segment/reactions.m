% Gravity
VG_ij = [S_ij(1),S_ij(2),S_ij(3); -(dNNdx(S_ij(1),S_ij(2)))/(sqrt((dNNdx(S_ij(1),S_ij(2)))^2 + ((dNNdy(S_ij(1),S_ij(2))))^2)),-(dNNdy(S_ij(1),S_ij(2)))/(sqrt((dNNdx(S_ij(1),S_ij(2)))^2 + ((dNNdy(S_ij(1),S_ij(2))))^2)),NN_ij(S_ij(1)-(dNNdx(S_ij(1),S_ij(2)))/(sqrt((dNNdx(S_ij(1),S_ij(2)))^2 + ((dNNdy(S_ij(1),S_ij(2))))^2)),S_ij(2)-(dNNdy(S_ij(1),S_ij(2)))/(sqrt((dNNdx(S_ij(1),S_ij(2)))^2 + ((dNNdy(S_ij(1),S_ij(2))))^2)))];
A_g_ij = [S_ij(1),S_ij(2),S_ij(3); (T*m*g*cos(pi-acos((dot([0,0,1],VG_ij(2,:)))/((mag(VG_ij))^2))))*cos(falpha(VG_ij)),(T*m*g*cos(pi-acos((dot([0,0,1],VG_ij(2,:)))/((mag(VG_ij))^2))))*cos(fbeta(VG_ij)),(T*m*g*cos(pi-acos((dot([0,0,1],VG_ij(2,:)))/((mag(VG_ij))^2))))*cos(fgamma(VG_ij))];
A_g_ij = [S_ij(1),S_ij(2),S_ij(3); 0,0,0];

% Normal
A_n_ij = [S_ij(1),S_ij(2),S_ij(3); -B_ij(2,1),-B_ij(2,2),-B_ij(2,3)];
s{iit,jit}.A_n_ij = vpa(A_n_ij);
s{iit,jit}.S_ij = vpa(S_ij);

% Elasticity
A_e_ij = [S_ij(1),S_ij(2),S_ij(3); 0, 0, 0];
if jit == Kt
    A_e_ij(2,1) = ((K(s{iit,1}.S_ij(1),s{iit,1}.S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(s{iit,1}.A_n_ij(2,1))/T;
    A_e_ij(2,2) = ((K(s{iit,1}.S_ij(1),s{iit,1}.S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(s{iit,1}.A_n_ij(2,2))/T;
    A_e_ij(2,3) = ((K(s{iit,1}.S_ij(1),s{iit,1}.S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(s{iit,1}.A_n_ij(2,3))/T;
end
    
% Friction
A_G_ij = vpasolve(((mag(A_g_ij))^2)+(VAL^2)==(mag([S_ij(1),S_ij(2),S_ij(3); 0,0,-T*m*g]))^2, VAL);
A_f_ij = [R_ij(1),R_ij(2),R_ij(3); -((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))^2 * cos(falpha(O_ij)),-((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))^2 * cos(fbeta(O_ij)),-((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))^2 * cos(fgamma(O_ij))];
A_f_ij = [S_ij(1),S_ij(2),S_ij(3); 0,0,0];

% Rotation
    % Influence
pOmega_ij = ((mag(O_ij))/T)/(d/2) * (pi/180);
pA_ij = cos(pOmega_ij);
pB_ij = (sin(pOmega_ij)*(-O_ij(2,2)))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2));
pC_ij = (sin(pOmega_ij)*(O_ij(2,1)))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2));
pD_ij = (sin(pOmega_ij)*NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2));
    % Multiply
[QA_ij,QB_ij,QC_ij,QD_ij,QOmega_ij] = multiply(qA_ij,qB_ij,qC_ij,qD_ij,qOmega_ij,pA_ij,pB_ij,pC_ij,pD_ij,pOmega_ij);
    % Vectors
VQ_ij = [S_ij(1),S_ij(2),S_ij(3); (QC_ij)/(sin(QOmega_ij)),-(QB_ij)/(sin(QOmega_ij)),NN_ij(S_ij(1)+(QC_ij)/(sin(QOmega_ij)),S_ij(2)-(QB_ij)/(sin(QOmega_ij)))-S_ij(3)];
A_r_ij = [S_ij(1),S_ij(2),S_ij(3); (d/2)*QOmega_ij*cos(falpha(VQ_ij)),(d/2)*QOmega_ij*cos(fbeta(VQ_ij)),(d/2)*QOmega_ij*cos(fgamma(VQ_ij))];
A_r_ij = [S_ij(1),S_ij(2),S_ij(3); 0,0,0];

display("reactions.m");