% Gravity
VG_ij = [S_ij(1),S_ij(2),S_ij(3); -(dNNdx(S_ij(1),S_ij(2))),-(dNNdy(S_ij(1),S_ij(2))),NN_ij(S_ij(1)-(dNNdx(S_ij(1),S_ij(2))),S_ij(2)-(dNNdy(S_ij(1),S_ij(2))))-S_ij(3)];
A_g_ij = [S_ij(1),S_ij(2),S_ij(3); ((T*m*g)*((dot([0,0,-1],VG_ij(2,:)))/(mag(VG_ij))))*cos(falpha(VG_ij)),((T*m*g)*((dot([0,0,-1],VG_ij(2,:)))/(mag(VG_ij))))*cos(fbeta(VG_ij)),((T*m*g)*((dot([0,0,-1],VG_ij(2,:)))/(mag(VG_ij))))*cos(fgamma(VG_ij))];
%A_G_ij = vpasolve((mag(A_g_ij))^2 + (VAL)^2 == (T*m*g)^2, VAL);

% Normal
s{iit,jit}.B_ij = vpa(B_ij);
if jit <= Kt_i
    A_n_ij = [S_ij(1),S_ij(2),S_ij(3); (-(mag(s{iit,1}.B_ij))/T)/Kt_i * cos(falpha(B_ij)),(-(mag(s{iit,1}.B_ij))/T)/Kt_i * cos(fbeta(B_ij)),(-(mag(s{iit,1}.B_ij))/T)/Kt_i * cos(fgamma(B_ij))];
else
    A_n_ij = [S_ij(1),S_ij(2),S_ij(3); (-(mag(B_ij))/T) * cos(falpha(B_ij)),(-(mag(B_ij))/T) * cos(fbeta(B_ij)),(-(mag(B_ij))/T) * cos(fgamma(B_ij))];
end
s{iit,jit}.A_n_ij = vpa(A_n_ij);
S_ij = vpa(S_ij);   

% Elasticity
A_e_ij = [S_ij(1),S_ij(2),S_ij(3); 0, 0, 0];
if jit <= Kt_i
    A_e_ij(2,1) = ((K(S_ij(1),S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(mag(s{iit,1}.A_n_ij)) * cos(falpha(A_n_ij));
    A_e_ij(2,2) = ((K(S_ij(1),S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(mag(s{iit,1}.A_n_ij)) * cos(fbeta(A_n_ij));
    A_e_ij(2,3) = ((K(S_ij(1),S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(mag(s{iit,1}.A_n_ij)) * cos(fgamma(A_n_ij));
end

% Friction
%A_f_ij = [R_ij(1),R_ij(2),R_ij(3); (-0.31875*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))) * cos(falpha(O_ij)),(-0.31875*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))) * cos(fbeta(O_ij)),(-0.31875*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))) * cos(fgamma(O_ij))];
A_f_ij = [R_ij(1),R_ij(2),R_ij(3); -(0.025*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (mag(A_n_ij))) * cos(falpha(O_ij)),-(0.025*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (mag(A_n_ij))) * cos(fbeta(O_ij)),-(0.025*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (mag(A_n_ij))) * cos(fgamma(O_ij))];

% Rotation
    % Influence
Wlength = (mag(O_ij))/(d/2);
%p_ij = [S_ij(1),S_ij(2),S_ij(3);(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*((-O_ij(2,2))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2))),(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*((O_ij(2,1))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2))),(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*((NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2)))];
p_ij_direction = [S_ij(1),S_ij(2),S_ij(3);(-O_ij(2,2)), (O_ij(2,1)),(NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))-S_ij(3)];
p_ij = [S_ij(1),S_ij(2),S_ij(3);(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*cos(falpha(p_ij_direction)),(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*cos(fbeta(p_ij_direction)),(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*cos(fgamma(p_ij_direction))];
    % New Angular Velocity
Q_ij = [R_ij(1),R_ij(2),R_ij(3); p_ij(2,1)+q_ij(2,1),p_ij(2,2)+q_ij(2,2),p_ij(2,3)+q_ij(2,3)];
    % Reactionary
VQ_ij = [S_ij(1),S_ij(2),S_ij(3); q_ij(2,2),-q_ij(2,1),NN_ij(S_ij(1)+q_ij(2,2),S_ij(2)-q_ij(2,1))-S_ij(3)];
A_r_ij = [S_ij(1),S_ij(2),S_ij(3); -(d*2)*(((F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*mag(p_ij))*T *cos(falpha(VQ_ij)), -(d*2)*(((F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*mag(p_ij))*T *cos(fbeta(VQ_ij)), -(d*2)*(((F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*mag(p_ij))*T *cos(fgamma(VQ_ij))];


display("reactions.m");