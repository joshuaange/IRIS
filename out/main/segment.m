% Traced Segment Path
quiver3(s{iit,jit}.O_ij(1,1),s{iit,jit}.O_ij(1,2),s{iit,jit}.O_ij(1,3),s{iit,jit}.O_ij(2,1),s{iit,jit}.O_ij(2,2),s{iit,jit}.O_ij(2,3),'lineWidth',0.5,'Color','blue','MaxHeadSize',0.5,'DisplayName','Traced Path Segment');
% Velocity
quiver3(s{iit,jit}.v_ij(1,1),s{iit,jit}.v_ij(1,2),s{iit,jit}.v_ij(1,3),s{iit,jit}.v_ij(2,1),s{iit,jit}.v_ij(2,2),s{iit,jit}.v_ij(2,3),'lineWidth',0.5,'Color','green','MaxHeadSize',0.5,'DisplayName','Initial Velocity');
quiver3(s{iit,jit}.V_ij(1,1),s{iit,jit}.V_ij(1,2),s{iit,jit}.V_ij(1,3),s{iit,jit}.V_ij(2,1),s{iit,jit}.V_ij(2,2),s{iit,jit}.V_ij(2,3),'lineWidth',0.5,'Color','green','MaxHeadSize',0.5,'DisplayName','Final Velocity');
% Spin Quaternion
quiver3(s{iit,jit}.v_ij(1,1),s{iit,jit}.v_ij(1,2),s{iit,jit}.v_ij(1,3),s{iit,jit}.QB_ij/sin(s{iit,jit}.QOmega_ij),s{iit,jit}.QC_ij/sin(s{iit,jit}.QOmega_ij),s{iit,jit}.QD_ij/sin(s{iit,jit}.QOmega_ij),'lineWidth',0.5,'Color','black','MaxHeadSize',0.1,'DisplayName','Ground Spin Quaternion','LineStyle','--');

% Gravity
quiver3(s{iit,jit}.A_g_ij(1,1),s{iit,jit}.A_g_ij(1,2),s{iit,jit}.A_g_ij(1,3),s{iit,jit}.A_g_ij(2,1),s{iit,jit}.A_g_ij(2,2),s{iit,jit}.A_g_ij(2,3),'lineWidth',2,'Color','red','MaxHeadSize',0.5,'DisplayName','Gravity Application','LineStyle',':');
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