% Trajectory
fplot3(b{iit}.x_i,b{iit}.y_i,b{iit}.z_i,[0 double(b{iit}.t_f_i)],'DisplayName','Trajectory','lineWidth',1,'Color','black');
% Velocities
quiver3(b{iit}.u_i(1,1),b{iit}.u_i(1,2),b{iit}.u_i(1,3),b{iit}.u_i(2,1),b{iit}.u_i(2,2),b{iit}.u_i(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Launch Velocity');
quiver3(b{iit}.v_i(1,1),b{iit}.v_i(1,2),b{iit}.v_i(1,3),b{iit}.v_i(2,1),b{iit}.v_i(2,2),b{iit}.v_i(2,3),'lineWidth',1,'Color','red','MaxHeadSize',0.5,'DisplayName','Impact Velocity');
% Impact
plot3(b{iit}.S_i(1),b{iit}.S_i(2),b{iit}.S_i(3),'Marker','s','DisplayName','Impact Point');
% Spin Quaternion
quiver3(b{iit}.u_i(1,1),b{iit}.u_i(1,2),b{iit}.u_i(1,3),b{iit}.qB_i/sin(b{iit}.qOmega_i),b{iit}.qC_i/sin(b{iit}.qOmega_i),b{iit}.qD_i/sin(b{iit}.qOmega_i),'lineWidth',0.5,'Color','black','MaxHeadSize',0.1,'DisplayName','Air Spin Quaternion','LineStyle','--');

% Pod
surf(double(b{iit}.X_i), double(b{iit}.Y_i), double(b{iit}.Z_i),'DisplayName','Pod','facealpha',0.75,'edgealpha',0.5)
% Center
plot3(double(b{iit}.C_i(1)),double(b{iit}.C_i(2)),double(b{iit}.C_i(3)),'Marker','o','DisplayName','Center Point');