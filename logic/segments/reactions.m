% Normal - base calculations from (http://hyperphysics.phy-astr.gsu.edu/hbase/frict.html)
    % B_ij for Gravity
        % Parallel Vector - along tangent plane in direction of velocity
    PGN_ij = F_g_ij(2,:)-((dot(F_g_ij(2,:),N_ij(2,:)))/((mag(N_ij))^2)).*N_ij(2,:);
    PG_ij = [C_ij(1),C_ij(2),C_ij(3); PGN_ij(1), PGN_ij(2), PGN_ij(3)];
        % Perpendicular Vector - perpendicular to tangent plane (pointing downwards)
    B_m_ij = max(real(vpasolve((mag([C_ij(1)+PG_ij(2,1),C_ij(2)+PG_ij(2,2),C_ij(3)+PG_ij(2,3); VAL*dNNdx,VAL*dNNdy,VAL*(-1)]))^2 + (mag(PG_ij))^2 == (mag(F_v_ij))^2, VAL)));
    if B_m_ij == 0
        B_m_ij = B_m_min; % Distance between velocity and parallel vector head
    end
    BG_ij = [C_ij(1)+PG_ij(2,1),C_ij(2)+PG_ij(2,2),C_ij(3)+PG_ij(2,3); B_m_ij*dNNdx,B_m_ij*dNNdy,B_m_ij*(-1)];
if jit <= Kt_i
    F_N_ij = [C_ij(1) C_ij(2) C_ij(3); -(B_ij(2,1)+BG_ij(2,1)), -(B_ij(2,2)+BG_ij(2,2)), -(B_ij(2,3)+BG_ij(2,3))];
else
    F_N_ij = [C_ij(1) C_ij(2) C_ij(3); 0 0 0];
    % Assuming the duration is complete, but the pod is still rolling,
    % velocity is being applied from the normal vector at the same
    % direction as the velocity it is reacting to, so we don't need to
    % calculate any change in velocity from the normal vector.
end

% Elasticity
F_e_ij = [C_ij(1),C_ij(2),C_ij(3); 0, 0, 0];
if jit <= Kt_i % Normal force multiplied by average Coefficient of Restitution
    F_e_ij(2,1) = K(S_ij(1),S_ij(2))*(mag(s{iit,jit}.F_N_ij)) * cos(falpha(F_N_ij));
    F_e_ij(2,2) = K(S_ij(1),S_ij(2))*(mag(s{iit,jit}.F_N_ij)) * cos(fbeta(F_N_ij));
    F_e_ij(2,3) = K(S_ij(1),S_ij(2))*(mag(s{iit,jit}.F_N_ij)) * cos(fgamma(F_N_ij));
end

% Tentative traced segment vector
O_ij = [C_ij(1),C_ij(2),C_ij(3); v_ij(2,1)*T + 0.5*(F_g_ij(2,1)+F_N_ij(2,1)+F_e_ij(2,1))/m * T^2, v_ij(2,2)*T + 0.5*(F_g_ij(2,2)+F_N_ij(2,2)+F_e_ij(2,2))/m * T^2, v_ij(2,3)*T + 0.5*(F_g_ij(2,3)+F_N_ij(2,3)+F_e_ij(2,3))/m * T^2];
% Friction
F_f_ij = [C_ij(1),C_ij(2),C_ij(3); -F(S_ij(1),S_ij(2))*mag(f_N_ij)*cos(falpha(O_ij)) -F(S_ij(1),S_ij(2))*mag(f_N_ij)*cos(fbeta(O_ij)) -F(S_ij(1),S_ij(2))*mag(f_N_ij)*cos(fgamma(O_ij)) ];

display("reactions.m");