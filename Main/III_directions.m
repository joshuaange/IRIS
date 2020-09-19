% Getting Partial Derivatives
L_diffx = diff(L,x);
dLdx = matlabFunction(L_diffx,'Vars',[x y]);
L_diffy = diff(L,y);
dLdy = matlabFunction(L_diffy,'Vars',[x y]);
% Normal/Tangent Plane
dLdxS = dLdx(S(1),S(2));
dLdyS = dLdy(S(1),S(2));
N_handle = dLdxS*(x - S(1)) + dLdyS*(y - S(2)) + (S(3));
N = matlabFunction(N_handle,'Vars',[x y]);
% Normal Vector
v_N = [S(1) S(2) S(3); -dLdxS -dLdyS 1];
% Parallel Vector
v_PNmag = sqrt((v_N(2,1))^2+(v_N(2,2))^2+(v_N(2,3))^2);
v_PNdot = (v_Vi(2,:)).*(v_N(2,:));
v_PN = (v_Vi(2,:))-((v_PNdot/v_PNmag^2).*(v_N(2,:)));
v_P = [S(1) S(2) S(3); T*v_PN(1) T*v_PN(2) T*v_PN(3)];
% Perpendicular Vector
v_Bx = (S(1) + v_P(2,1));
v_By = (S(2) + v_P(2,2));
v_Bz = (S(3) + v_P(2,3));
v_B = [v_Bx v_By v_Bz; dLdxS dLdyS -1];

% Finding Magnitude to Terrain
v_Bmag = sqrt((v_B(2,1))^2+(v_B(2,2))^2+(v_B(2,3))^2);
alpha_v_B = acos(v_B(2,1)/v_Bmag);
beta_v_B = acos(v_B(2,2)/v_Bmag);
gamma_v_B = acos(v_B(2,3)/v_Bmag);
magnitude_equation = L(M*cos(alpha_v_B)+T*v_P(2,1)+S(1),M*cos(beta_v_B)+T*v_P(2,2)+S(2))==M*cos(gamma_v_B)+T*v_P(2,3)+S(3);
M = vpasolve(magnitude_equation, M);
% Next Starting Point Location
S_2 = [(M*cos(alpha_v_B)+T*v_P(2,1)+S(1)) (M*cos(beta_v_B)+T*v_P(2,2)+S(2)) (M*cos(gamma_v_B)+T*v_P(2,3)+S(3))];
% Traced Segment Vector
v_O = [S(1) S(2) S(3); S_2(1)-S(1) S_2(2)-S(2) S_2(3)-S(3)];