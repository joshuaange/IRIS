fid = fopen(strcat(folder,'\logic\trajectory\construct.m'),'w');
fprintf(fid, '%% This script is automatically constructed by trajectory.m \n');

% This function creates the position functions across axes while bearing in
% mind the dynamic nature of gravity and atmospheric density

t_A_end = 0;
t_A_last = 0; % Last time
t_A_vel = u_i; % Start position and velocity
t_A_vel(1,3) = t_A_vel(1,3)+L_min; 
% x_i and y_i continuous functions
fprintf(fid,strcat('x_i(t) = (',string(t_A_vel(2,1)),'*Q(z_i(t)))/g(z_i(t)) * (1-exp((-g(z_i(t))*t)/Q(z_i(t)))) + ',string(t_A_vel(1,1)),';\n'));
fprintf(fid,strcat('y_i(t) = (',string(t_A_vel(2,2)),'*Q(z_i(t)))/g(z_i(t)) * (1-exp((-g(z_i(t))*t)/Q(z_i(t)))) + ',string(t_A_vel(1,2)),';\n'));
% Looping through and constructing piecewise equation from intervals (z_i because there is a natural stopping point at L_min)
fprintf(fid, 'z_i(t) = piecewise(');
while t_A_end == 0
    % Creating equation for position based on interval
    z_i(t) = (Q(t_A_vel(1,3))/g(t_A_vel(1,3))) * ((t_A_vel(2,3))+Q(t_A_vel(1,3))) * (1-exp((-g(t_A_vel(1,3))*(t))/Q(t_A_vel(1,3)))) - (Q(t_A_vel(1,3))*(t)) + t_A_vel(1,3);
    
    % Printing to construct.m
    fprintf(fid,strcat('(',string((t_A_last)),'<=t<',string((t_A_last)+t_A_int),'), ','(',string(double(Q(t_A_vel(1,3)))),'/',string(double(g(t_A_vel(1,3)))),') * ((',string((t_A_vel(2,3))),')+',string(double(Q(t_A_vel(1,3)))),') * (1-exp((-',string(double(g(t_A_vel(1,3)))),'*(t-',string(double(t_A_last)),'))/',string(double(Q(t_A_vel(1,3)))),')) - (',string(double(Q(t_A_vel(1,3)))),'*(t-',string(double(t_A_last)),')) + ',string((t_A_vel(1,3))))); 
    
    % Finding start conditions for subsequent loop
    t_A_vel(1,3) = double(z_i(t_A_int));
    t_A_diff = diff(z_i); 
    t_A_vel(2,3) = double(t_A_diff(t_A_int));
    
    % End condition
    if t_A_vel(1,3) <= L_min
        t_A_end = 1;
        fprintf(fid, ');\n');
        % Running so z data can be used by x and y scripts
        fclose(fid);
        run(strcat(folder,'\logic\trajectory\construct.m')); 
    else
        % moving to next interval for subsequent loop
        t_A_last = t_A_last + t_A_int;
        fprintf(fid, ', ');
    end
end

% 
% % Parametric Trajectory
% display("Generating parametric trajectory curve");
%  % Parametric curve
%  % (http://farside.ph.utexas.edu/teaching/336k/Newtonhtml/node29.html)
% x_i(t) = piecewise((t<=(2*t_int)), u_i(1,1), (t>(2*t_int)), ((u_i(2,1))*Q(z_i(t-t_int)))/g(z_i(t-t_int)) * (1-exp((-g(z_i(t-t_int))*t)/Q(z_i(t-t_int)))) + u_i(1,1));
% y_i(t) = piecewise((t<=(2*t_int)), u_i(1,2), (t>(2*t_int)), ((u_i(2,2))*Q(z_i(t-t_int)))/g(z_i(t-t_int)) * (1-exp((-g(z_i(t-t_int))*t)/Q(z_i(t-t_int)))) + u_i(1,2));
% z_i(t) = piecewise((t<=(2*t_int)), u_i(1,3), (t>(2*t_int)), (Q(z_i(t-t_int))/g(z_i(t-t_int))) * ((u_i(2,3))+Q(z_i(t-t_int))) * (1-exp((-g(z_i(t-t_int))*t)/Q(z_i(t-t_int)))) - (Q(z_i(t-t_int))*t) + u_i(1,3));
% dx_idt = diff(x_i);
% dy_idt = diff(y_i);
% dz_idt = diff(z_i);
% fplot(z_i,[0 1000],'Color','green');
% hold on
% if iit == 1 && parachute == 1
%     % Parachute changes terminal velocity to Q_o at t_o
%     x_i(t) = piecewise((t<=t_o), x_i(t), (t>t_o), ((dx_idt(t_o))*Q_o(z_i(t-t_int)))/g(z_i(t-t_int)) * (1-exp((-g(z_i(t-t_int))*t)/Q_o(z_i(t-t_int)))) + x_i(t_o));
%     y_i(t) = piecewise((t<=t_o), y_i(t), (t>t_o), ((dy_idt(t_o))*Q_o(z_i(t-t_int)))/g(z_i(t-t_int)) * (1-exp((-g(z_i(t-t_int))*t)/Q_o(z_i(t-t_int)))) + y_i(t_o));
%     z_i(t) = piecewise((t<=t_o), z_i(t), (t>t_o), (Q_o(z_i(t-t_int))/g(z_i(t-t_int))) * ((dz_idt(t_o))+Q_o(z_i(t-t_int))) * (1-exp((-g(z_i(t-t_int))*(t-t_o))/Q_o(z_i(t-t_int)))) - (Q_o(z_i(t-t_int))*t) + z_i(t_o));
%     dx_idt = diff(x_i);
%     dy_idt = diff(y_i);
%     dz_idt = diff(z_i);
% end
% 
% fplot(z_i,[0 1000],'Color','red');
% hold off;