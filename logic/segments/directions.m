% Tangent Plane and Normal Vector
dNNdx = double(dLdx(vpa(S_ij(1)),vpa(S_ij(2)))); % Derivative values of impact position
dNNdy = double(dLdy(vpa(S_ij(1)),vpa(S_ij(2))));
if dNNdx == 0
    dNNdx = derivative_min;
end
if dNNdy == 0
    dNNdy = derivative_min;
end
NN_ij = @(x,y) dNNdx*(x-S_ij(1))+dNNdy*(y-S_ij(2))+S_ij(3); % Tangent plane to impact position
N_ij = [S_ij(1),S_ij(2),S_ij(3); -dNNdx,-dNNdy,1]; % Normal vector of impact position

% Applied force (includes gravity if jit = 1)
F_v_ij = [C_ij(1), C_ij(2), C_ij(3); m*a_ij(2,1), m*a_ij(2,2), m*a_ij(2,3)];
% Gravitational force
F_g_ij = [C_ij(1), C_ij(2), C_ij(3); 0, 0, -g(C_ij(3))];

% Component vectors of initial force
    % Parallel Vector - along tangent plane in direction of velocity
PN_ij = F_v_ij(2,:)-((dot(F_v_ij(2,:),N_ij(2,:)))/((mag(N_ij))^2)).*N_ij(2,:);
P_ij = [C_ij(1),C_ij(2),C_ij(3); PN_ij(1), PN_ij(2), PN_ij(3)];
    % Perpendicular Vector - perpendicular to tangent plane (pointing downwards)
B_m_ij = max(real(vpasolve((mag([C_ij(1)+P_ij(2,1),C_ij(2)+P_ij(2,2),C_ij(3)+P_ij(2,3); VAL*dNNdx,VAL*dNNdy,VAL*(-1)]))^2 + (mag(P_ij))^2 == (mag(F_v_ij))^2, VAL)));
if B_m_ij == 0
    B_m_ij = B_m_min; % Distance between velocity and parallel vector head
end
B_ij = [C_ij(1)+P_ij(2,1),C_ij(2)+P_ij(2,2),C_ij(3)+P_ij(2,3); B_m_ij*dNNdx,B_m_ij*dNNdy,B_m_ij*(-1)];

% % Number of time segments - simple estimation
% %(from https://www.researchgate.net/publication/270681194_Estimation_of_the_Impact_Duration_for_Several_Types_of_Structures)
% if jit == 1 
%     Kt_V = (mag(B_ij)/T); % Full downwards impact velocity
%     k_lin = (pi/3.21)^2 * (m*(k_H^4)*(Kt_V^2))^(1/5); % Linear stiffness 
%     T_HS = pi*sqrt(m/k_lin); % Impact duration
%     Kt_i = (T_HS)/T; % Number of time segments (rounded)
%     Kt_i = round(Kt_i);
%     if Kt_i < 1
%        Kt_i = 1; 
%     end
%     b{iit}.Kt_i = vpa(Kt_i);
%     display("DURATION: " + double(Kt_i));
% end

display("directions.m");