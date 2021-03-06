 try
    figure(figure_main);
catch
    figure_main = figure('Name','Pod Motion');
end

surfc(L_x, L_y, L_z(:,:,1),'EdgeAlpha',0,'FaceAlpha',1,'DisplayName','Surface Topology') % Mesh Plot
colormap(gray) 
hold on;
%surfc(F_x, F_y, F_z,'EdgeAlpha',0.1,'FaceAlpha',1,'DisplayName','Coefficient of Friction') % Mesh Plot
%surfc(F_r_x, F_r_y, F_r_z,'EdgeAlpha',0.1,'FaceAlpha',1,'DisplayName','Coefficient of Rolling Friction') % Mesh Plot
%surfc(G_l_x, G_l_y, G_l_z,'EdgeAlpha',0.1,'FaceAlpha',1,'DisplayName','Modulus of Rigidity') % Mesh Plot
%surfc(K_x, K_y, K_z,'EdgeAlpha',0.1,'FaceAlpha',1,'DisplayName','Coefficient of Restitution') % Mesh Plot
%surfc(T_c_x, T_c_y, T_c_z,'EdgeAlpha',0.1,'FaceAlpha',1,'DisplayName','Conductivity') % Mesh Plot
%surfc(T_g_x, T_g_y, T_g_z,'EdgeAlpha',0.1,'FaceAlpha',1,'DisplayName','Temperature') % Mesh Plot
%surfc(Y_l_x, Y_l_y, Y_l_z,'EdgeAlpha',0.1,'FaceAlpha',1,'DisplayName','Youngs Modulus') % Mesh Plot

 for iit = 1:i_max
     if isempty(b{iit}) == 0
        % Trajectory
        fplot3(b{iit}.x_i,b{iit}.y_i,b{iit}.z_i,[0 double(b{iit}.t_f_i)],'DisplayName','Trajectory','lineWidth',1,'Color','black');
        % Velocities
        quiver3(b{iit}.u_i(1,1),b{iit}.u_i(1,2),b{iit}.u_i(1,3),b{iit}.u_i(2,1),b{iit}.u_i(2,2),b{iit}.u_i(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Launch Velocity');
        quiver3(b{iit}.v_i(1,1),b{iit}.v_i(1,2),b{iit}.v_i(1,3),b{iit}.v_i(2,1),b{iit}.v_i(2,2),b{iit}.v_i(2,3),'lineWidth',1,'Color','red','MaxHeadSize',0.5,'DisplayName','Impact Velocity');
        % Impact
        plot3(b{iit}.S_i(1),b{iit}.S_i(2),b{iit}.S_i(3),'Marker','s','DisplayName','Impact Point');
        % Spin Quaternion
        quiver3(b{iit}.q_i(1,1),b{iit}.q_i(1,2),b{iit}.q_i(1,3),b{iit}.q_i(2,1),b{iit}.q_i(2,2),b{iit}.q_i(2,3),'lineWidth',0.5,'Color','black','MaxHeadSize',0.1,'DisplayName','Air Spin Quaternion','LineStyle','--');

        % Pod
        surf(double(b{iit}.X_i), double(b{iit}.Y_i), double(b{iit}.Z_i),'DisplayName','Pod','facealpha',0.75,'edgealpha',0.5)
        % Center
        plot3(double(b{iit}.C_i(1)),double(b{iit}.C_i(2)),double(b{iit}.C_i(3)),'Marker','o','DisplayName','Center Point');
     end
     for jit = 1:j_max
         if isempty(s{iit,jit}) == 0
            % Traced Segment Path
            quiver3(s{iit,jit}.O_ij(1,1),s{iit,jit}.O_ij(1,2),s{iit,jit}.O_ij(1,3),s{iit,jit}.O_ij(2,1),s{iit,jit}.O_ij(2,2),s{iit,jit}.O_ij(2,3),'lineWidth',1,'Color','black','MaxHeadSize',0.5,'DisplayName','Traced Path Segment');
            quiver3(s{iit,jit}.N_ij(1,1),s{iit,jit}.N_ij(1,2),s{iit,jit}.N_ij(1,3),s{iit,jit}.N_ij(2,1),s{iit,jit}.N_ij(2,2),s{iit,jit}.N_ij(2,3),'lineWidth',2,'Color','red','MaxHeadSize',0.5,'DisplayName','Normal Vector');
            % Velocity
            quiver3(s{iit,jit}.v_ij(1,1),s{iit,jit}.v_ij(1,2),s{iit,jit}.v_ij(1,3),s{iit,jit}.v_ij(2,1),s{iit,jit}.v_ij(2,2),s{iit,jit}.v_ij(2,3),'lineWidth',0.5,'Color','green','MaxHeadSize',0.5,'DisplayName','Initial Velocity');
            quiver3(s{iit,jit}.V_ij(1,1),s{iit,jit}.V_ij(1,2),s{iit,jit}.V_ij(1,3),s{iit,jit}.V_ij(2,1),s{iit,jit}.V_ij(2,2),s{iit,jit}.V_ij(2,3),'lineWidth',0.5,'Color','green','MaxHeadSize',0.5,'DisplayName','Final Velocity');
            % Spin Quaternion
            quiver3(s{iit,jit}.p_ij(1,1),s{iit,jit}.p_ij(1,2),s{iit,jit}.p_ij(1,3),s{iit,jit}.p_ij(2,1),s{iit,jit}.p_ij(2,2),s{iit,jit}.p_ij(2,3),'lineWidth',0.5,'Color','red','MaxHeadSize',0.1,'DisplayName','Influence Quaternion','LineStyle','--');
            quiver3(s{iit,jit}.q_ij(1,1),s{iit,jit}.q_ij(1,2),s{iit,jit}.q_ij(1,3),s{iit,jit}.q_ij(2,1),s{iit,jit}.q_ij(2,2),s{iit,jit}.q_ij(2,3),'lineWidth',0.5,'Color','black','MaxHeadSize',0.1,'DisplayName','Ground Spin Quaternion 1','LineStyle','--');
            quiver3(s{iit,jit}.Q_ij(1,1),s{iit,jit}.Q_ij(1,2),s{iit,jit}.Q_ij(1,3),s{iit,jit}.Q_ij(2,1),s{iit,jit}.Q_ij(2,2),s{iit,jit}.Q_ij(2,3),'lineWidth',0.5,'Color','blue','MaxHeadSize',0.1,'DisplayName','Ground Spin Quaternion 2','LineStyle','--');

            % Gravity
            quiver3(s{iit,jit}.F_g_ij(1,1),s{iit,jit}.A_g_ij(1,2),s{iit,jit}.A_g_ij(1,3),s{iit,jit}.A_g_ij(2,1),s{iit,jit}.A_g_ij(2,2),s{iit,jit}.A_g_ij(2,3),'lineWidth',2,'Color','red','MaxHeadSize',0.5,'DisplayName','Gravity Application','LineStyle',':');
            % Normal
            quiver3(s{iit,jit}.F_N_ij(1,1),s{iit,jit}.A_n_ij(1,2),s{iit,jit}.A_n_ij(1,3),s{iit,jit}.A_n_ij(2,1),s{iit,jit}.A_n_ij(2,2),s{iit,jit}.A_n_ij(2,3),'lineWidth',1,'Color','black','MaxHeadSize',0.5,'DisplayName','Normal Application','LineStyle',':');
            % Elasticity
            quiver3(s{iit,jit}.F_e_ij(1,1),s{iit,jit}.A_e_ij(1,2),s{iit,jit}.A_e_ij(1,3),s{iit,jit}.A_e_ij(2,1),s{iit,jit}.A_e_ij(2,2),s{iit,jit}.A_e_ij(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Elastic Application','LineStyle',':');
            % Friction
            quiver3(s{iit,jit}.F_f_ij(1,1),s{iit,jit}.A_f_ij(1,2),s{iit,jit}.A_f_ij(1,3),s{iit,jit}.A_f_ij(2,1),s{iit,jit}.A_f_ij(2,2),s{iit,jit}.A_f_ij(2,3),'lineWidth',2,'Color','yellow','MaxHeadSize',0.5,'DisplayName','Friction Application','LineStyle',':');
            % Rotation
            quiver3(s{iit,jit}.F_R_ij(1,1),s{iit,jit}.A_r_ij(1,2),s{iit,jit}.A_r_ij(1,3),s{iit,jit}.A_r_ij(2,1),s{iit,jit}.A_r_ij(2,2),s{iit,jit}.A_r_ij(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.5,'DisplayName','Rotation Application','LineStyle',':');

            % Pod
            surf(double(s{iit,jit}.Xn_ij), double(s{iit,jit}.Yn_ij), double(s{iit,jit}.Zn_ij),'DisplayName','Pod','facealpha',0.75,'edgealpha',0.5)
            % Center Point
            plot3(double(s{iit,jit}.Cn_ij(1)),double(s{iit,jit}.Cn_ij(2)),double(s{iit,jit}.Cn_ij(3)),'Marker','s','DisplayName','Impact Point');
         end
     end
end

grid minor;
axis equal;
xlim([0 Domain]);
ylim([0 Domain]);
%zlim([0 L_max]);
view(3);
%legend;
hold off;