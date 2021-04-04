% Gravity - basic trigonometry to find movement from gravity
display("...Gravity");
VG_ij = [S_ij(1),S_ij(2),S_ij(3); -(dNNdx),-(dNNdy),NN_ij(S_ij(1)-(dNNdx),S_ij(2)-(dNNdy))-S_ij(3)]; % Gradient descent vector
A_g_ij = [S_ij(1),S_ij(2),S_ij(3); ((T*m*g)*((dot([0,0,-1],VG_ij(2,:)))/(mag(VG_ij))))*cos(falpha(VG_ij)),((T*m*g)*((dot([0,0,-1],VG_ij(2,:)))/(mag(VG_ij))))*cos(fbeta(VG_ij)),((T*m*g)*((dot([0,0,-1],VG_ij(2,:)))/(mag(VG_ij))))*cos(fgamma(VG_ij))]; % Dot product finds how long the gravity vector should be (hypotenuse is [0,0,-Tmg])
A_G_ij = T*max(vpasolve((mag(A_g_ij))^2 + (VAL)^2 == (T*m*g)^2, VAL)); % Vector finishes gravity right triangle

% Normal - base calculations from (http://hyperphysics.phy-astr.gsu.edu/hbase/frict.html)
display("...Normal");
s{iit,jit}.B_ij = vpa(B_ij);
if jit <= Kt_i % Normal force reaction from velocity "finishes" after duration of collision is over 
    A_n_ij = [S_ij(1),S_ij(2),S_ij(3); (-(mag(s{iit,1}.B_ij))/T)/Kt_i * cos(falpha(B_ij)),(-(mag(s{iit,1}.B_ij))/T)/Kt_i * cos(fbeta(B_ij)),(-(mag(s{iit,1}.B_ij))/T)/Kt_i * cos(fgamma(B_ij))];
    % Not a perfect calculation, but sufficient for most circumstances - it
    % counteracts the primary velocity in the opposite direction of the
    % perpendicular vector for the duration of the total collision (in this
    % manner, it can change direction, but not magnitude, which is
    % satisfactory most of the time).
else
    A_n_ij = [S_ij(1),S_ij(2),S_ij(3); 0, 0, 0];
    % Assuming the duration is complete, but the pod is still rolling,
    % velocity is being applied from the normal vector at the same
    % direction as the velocity it is reacting to, so we don't need to
    % calculate any change in velocity from the normal vector.
end
s{iit,jit}.A_n_ij = vpa(A_n_ij);
S_ij = vpa(S_ij);   

% Elasticity
display("...Elasticity");
A_e_ij = [S_ij(1),S_ij(2),S_ij(3); 0, 0, 0];
if jit <= Kt_i % Normal force multiplied by average Coefficient of Restitution
    A_e_ij(2,1) = ((K(S_ij(1),S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(mag(s{iit,1}.A_n_ij)) * cos(falpha(A_n_ij));
    A_e_ij(2,2) = ((K(S_ij(1),S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(mag(s{iit,1}.A_n_ij)) * cos(fbeta(A_n_ij));
    A_e_ij(2,3) = ((K(S_ij(1),S_ij(2))+K(R_ij(1),R_ij(2)))/2)*(mag(s{iit,1}.A_n_ij)) * cos(fgamma(A_n_ij));
end

% Friction - base calculations from (http://hyperphysics.phy-astr.gsu.edu/hbase/frict.html)
display("...Friction");
%A_f_ij = [R_ij(1),R_ij(2),R_ij(3); (-0.31875*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))) * cos(falpha(O_ij)),(-0.31875*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))) * cos(fbeta(O_ij)),(-0.31875*((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2) * (max(A_G_ij)+mag(A_n_ij))) * cos(fgamma(O_ij))];
%A_f_ij = [R_ij(1),R_ij(2),R_ij(3);-(((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(falpha(O_ij)),-(((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(fbeta(O_ij)),-(((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(fgamma(O_ij))];
A_f_ij = [R_ij(1),R_ij(2),R_ij(3);-(((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(falpha(v_ij)),-(((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(fbeta(v_ij)),-(((F(S_ij(1),S_ij(2))+F(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(fgamma(v_ij))];
% Movement in direction opposite to traced segment vector, magnitude of
% average coefficient of friction multiplied by applied Normal velocity 
% change added to the finishing right triangle vector of gravity (which
% forms the total Normal Velocity impact)
% !! We don't include gravity for the first segment, because the impact
% velocity includes it

% Rotation
display("...Rotation");
    % Influence
Wlength = (mag(O_ij))/(d/2); % Finds angular velocity from linear velocity
%p_ij = [S_ij(1),S_ij(2),S_ij(3);(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*((-O_ij(2,2))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2))),(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*((O_ij(2,1))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2))),(1-(F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*Wlength*((NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))/(sqrt((-O_ij(2,2))^2 + (O_ij(2,1))^2 + (NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))^2)))];
p_ij_direction = [S_ij(1),S_ij(2),S_ij(3);(-O_ij(2,2)), (O_ij(2,1)),(NN_ij(S_ij(1)-O_ij(2,2),S_ij(2)+O_ij(2,1)))-S_ij(3)]; % Right-angle vector to traced segment vector
XROT = cos(falpha(p_ij_direction)); % Setting values outside of range
YROT = cos(fbeta(p_ij_direction));
ZROT = cos(fgamma(p_ij_direction));
if XROT == cos(pi/2)
    XROT = 0;
end
if YROT == cos(pi/2)
    YROT = 0;
end
if ZROT == cos(pi/2)
    ZROT = 0;
end
% Finding influence vector from velocity (similar to freefall equations)
% >>look at https://physics.stackexchange.com/questions/66106/slowdown-rate-of-rotating-body-due-to-friction-force/66116#:~:text=Slowdown%20rate%20of%20rotating%20body%20due%20to%20friction%20force%20%5Bclosed%5D&text=a%3DF%2Fm%2C%20the,a%3D%E2%88%92f%2Fm.
% and https://www.khanacademy.org/science/high-school-physics/torque-and-angular-momentum/rotational-inertia-and-angular-second-law/a/rotational-inertia-ap1
A_fr_ij = [R_ij(1),R_ij(2),R_ij(3);-(((F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(falpha(O_ij)),-(((F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(fbeta(O_ij)),-(((F_r(S_ij(1),S_ij(2))+F_r(R_ij(1),R_ij(2)))/2)*(mag(A_n_ij)+(A_G_ij)))*cos(fgamma(O_ij))];
% Find torque from the rotational-friction force (found above), we then
% divide it by the moment of inertia (I) to find the angular acceleration
% as a result of friction, which we can use in a free-fall formula to find
% the ending angular velocity
p_ij = [S_ij(1),S_ij(2),S_ij(3);(Wlength*XROT)-(((d/2)*(m*abs(A_fr_ij(2,1))))/I)*T, (Wlength*YROT)-(((d/2)*(m*abs(A_fr_ij(2,2))))/I)*T, (Wlength*ZROT)-(((d/2)*(m*abs(A_fr_ij(2,3))))/I)*T];
    % New Angular Velocity
Q_ij = [R_ij(1),R_ij(2),R_ij(3); p_ij(2,1)+q_ij(2,1),p_ij(2,2)+q_ij(2,2),p_ij(2,3)+q_ij(2,3)];
    % Reactionary
VQ_ij = [S_ij(1),S_ij(2),S_ij(3); q_ij(2,2),-q_ij(2,1),NN_ij(S_ij(1)+q_ij(2,2),S_ij(2)-q_ij(2,1))-S_ij(3)]; % Direction vector back to linear movement
A_r_ij = [S_ij(1),S_ij(2),S_ij(3); ((d/2)*mag(q_ij))*cos(falpha(VQ_ij)),((d/2)*mag(q_ij))*cos(fbeta(VQ_ij)),((d/2)*mag(q_ij))*cos(fgamma(VQ_ij))]; % Conversion to linear velocity

display("reactions.m");