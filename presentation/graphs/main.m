try
    figure(figure_main);
catch
    figure_main = figure('Name','Pod Motion');
end

surfc(L_x, L_y, L_z,'EdgeAlpha',0.1,'FaceAlpha',1,'DisplayName','Surface Topology') % Mesh Plot
colormap(gray) 
hold on;

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
            quiver3(s{iit,jit}.VQ_ij(1,1),s{iit,jit}.VQ_ij(1,2),s{iit,jit}.VQ_ij(1,3),s{iit,jit}.VQ_ij(2,1),s{iit,jit}.VQ_ij(2,2),s{iit,jit}.VQ_ij(2,3),'lineWidth',0.5,'Color','green','MaxHeadSize',0.1,'DisplayName','Ground Spin Direction','LineStyle','--');
            quiver3(s{iit,jit}.Q_ij(1,1),s{iit,jit}.Q_ij(1,2),s{iit,jit}.Q_ij(1,3),s{iit,jit}.Q_ij(2,1),s{iit,jit}.Q_ij(2,2),s{iit,jit}.Q_ij(2,3),'lineWidth',0.5,'Color','blue','MaxHeadSize',0.1,'DisplayName','Ground Spin Quaternion 2','LineStyle','--');
            quiver3(s{iit,jit}.p_ij_direction(1,1),s{iit,jit}.p_ij_direction(1,2),s{iit,jit}.p_ij_direction(1,3),s{iit,jit}.p_ij_direction(2,1),s{iit,jit}.p_ij_direction(2,2),s{iit,jit}.p_ij_direction(2,3),'lineWidth',0.5,'Color','yellow','MaxHeadSize',0.1,'DisplayName','Influence Direction','LineStyle','--');

            % Gravity
            quiver3(s{iit,jit}.A_g_ij(1,1),s{iit,jit}.A_g_ij(1,2),s{iit,jit}.A_g_ij(1,3),s{iit,jit}.A_g_ij(2,1),s{iit,jit}.A_g_ij(2,2),s{iit,jit}.A_g_ij(2,3),'lineWidth',2,'Color','red','MaxHeadSize',0.5,'DisplayName','Gravity Application','LineStyle',':');
            quiver3(s{iit,jit}.VG_ij(1,1),s{iit,jit}.VG_ij(1,2),s{iit,jit}.VG_ij(1,3),s{iit,jit}.VG_ij(2,1),s{iit,jit}.VG_ij(2,2),s{iit,jit}.VG_ij(2,3),'lineWidth',0.5,'Color','yellow','MaxHeadSize',0.1,'DisplayName','Gravity Application Direction','LineStyle','--');
            % Normal
            quiver3(s{iit,jit}.A_n_ij(1,1),s{iit,jit}.A_n_ij(1,2),s{iit,jit}.A_n_ij(1,3),s{iit,jit}.A_n_ij(2,1),s{iit,jit}.A_n_ij(2,2),s{iit,jit}.A_n_ij(2,3),'lineWidth',1,'Color','black','MaxHeadSize',0.5,'DisplayName','Normal Application','LineStyle',':');
            % Elasticity
            quiver3(s{iit,jit}.A_e_ij(1,1),s{iit,jit}.A_e_ij(1,2),s{iit,jit}.A_e_ij(1,3),s{iit,jit}.A_e_ij(2,1),s{iit,jit}.A_e_ij(2,2),s{iit,jit}.A_e_ij(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Elastic Application','LineStyle',':');
            % Friction
            quiver3(s{iit,jit}.A_f_ij(1,1),s{iit,jit}.A_f_ij(1,2),s{iit,jit}.A_f_ij(1,3),s{iit,jit}.A_f_ij(2,1),s{iit,jit}.A_f_ij(2,2),s{iit,jit}.A_f_ij(2,3),'lineWidth',2,'Color','yellow','MaxHeadSize',0.5,'DisplayName','Friction Application','LineStyle',':');
            % Rotation
            quiver3(s{iit,jit}.A_r_ij(1,1),s{iit,jit}.A_r_ij(1,2),s{iit,jit}.A_r_ij(1,3),s{iit,jit}.A_r_ij(2,1),s{iit,jit}.A_r_ij(2,2),s{iit,jit}.A_r_ij(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.5,'DisplayName','Rotation Application','LineStyle',':');

            % Pod
            surf(double(s{iit,jit}.Xn_ij), double(s{iit,jit}.Yn_ij), double(s{iit,jit}.Zn_ij),'DisplayName','Pod','facealpha',0.75,'edgealpha',0.5)
            % Center Point
            plot3(double(s{iit,jit}.Cn_ij(1)),double(s{iit,jit}.Cn_ij(2)),double(s{iit,jit}.Cn_ij(3)),'Marker','s','DisplayName','Impact Point');
         end
     end
end

grid minor;
%axis equal;
xlim([0 L_domain]);
ylim([0 L_domain]);
zlim([0 L_range]);
view(3);
%legend;
hold off;