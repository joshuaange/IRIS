% Parametric Trajectory
display("Generating parametric trajectory curve");
x_i(t) = (u_i(2,1)*Q)/g * (1-exp((-g*t)/Q)) + u_i(1,1); % Parametric curve from http://farside.ph.utexas.edu/teaching/336k/Newtonhtml/node29.html
y_i(t) = (u_i(2,2)*Q)/g * (1-exp((-g*t)/Q)) + u_i(1,2);
z_i(t) = (Q/g) * (u_i(2,3)+Q) * (1-exp((-g*t)/Q)) - (Q*t) + u_i(1,3);
dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);
if iit == 1 && parachute == 1
    % Parachute changes terminal velocity to Q_o at t_o
    x_i(t) = piecewise((0<=t<t_o), x_i(t), (t>=t_o), (dx_idt(t_o)*Q_o)/g * (1-exp((-g*(t-t_o))/Q_o)) + x_i(t_o)); % Normal parametric curve prior to t_o, but includes parachute data after t_o
    y_i(t) = piecewise((0<=t<t_o), y_i(t), (t>=t_o), (dy_idt(t_o)*Q_o)/g * (1-exp((-g*(t-t_o))/Q_o)) + y_i(t_o));
    z_i(t) = piecewise((0<=t<t_o), z_i(t), (t>=t_o), (Q_o/g) * (dz_idt(t_o)+Q_o) * (1-exp((-g*(t-t_o))/Q_o)) - (Q_o*(t-t_o)) + z_i(t_o));
    dx_idt = diff(x_i);
    dy_idt = diff(y_i);
    dz_idt = diff(z_i);
end

display("trajectory.m");