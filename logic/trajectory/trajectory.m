Q_o(x) = sqrt((2*(m+m_o)*g(x))/(rho*1*C_d_o));

% Parametric Trajectory
display("Generating parametric trajectory curve");
 % Parametric curve
 % (http://farside.ph.utexas.edu/teaching/336k/Newtonhtml/node29.html)
x_i(t) = piecewise((t<=(2*t_int)), u_i(1,1), (t>(2*t_int)), ((u_i(2,1))*Q(z_i(t-t_int)))/g(z_i(t-t_int)) * (1-exp((-g(z_i(t-t_int))*t)/Q(z_i(t-t_int)))) + u_i(1,1));
y_i(t) = piecewise((t<=(2*t_int)), u_i(1,2), (t>(2*t_int)), ((u_i(2,2))*Q(z_i(t-t_int)))/g(z_i(t-t_int)) * (1-exp((-g(z_i(t-t_int))*t)/Q(z_i(t-t_int)))) + u_i(1,2));
z_i(t) = piecewise((t<=(2*t_int)), u_i(1,3), (t>(2*t_int)), (Q(z_i(t-t_int))/g(z_i(t-t_int))) * ((u_i(2,3))+Q(z_i(t-t_int))) * (1-exp((-g(z_i(t-t_int))*t)/Q(z_i(t-t_int)))) - (Q(z_i(t-t_int))*t) + u_i(1,3));
dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);
fplot(z_i,[0 1000],'Color','green');
hold on
if iit == 1 && parachute == 1
    % Parachute changes terminal velocity to Q_o at t_o
    x_i(t) = piecewise((t<=t_o), x_i(t), (t>t_o), ((dx_idt(t_o))*Q_o(z_i(t-t_int)))/g(z_i(t-t_int)) * (1-exp((-g(z_i(t-t_int))*t)/Q_o(z_i(t-t_int)))) + x_i(t_o));
    y_i(t) = piecewise((t<=t_o), y_i(t), (t>t_o), ((dy_idt(t_o))*Q_o(z_i(t-t_int)))/g(z_i(t-t_int)) * (1-exp((-g(z_i(t-t_int))*t)/Q_o(z_i(t-t_int)))) + y_i(t_o));
    z_i(t) = piecewise((t<=t_o), z_i(t), (t>t_o), (Q_o(z_i(t-t_int))/g(z_i(t-t_int))) * ((dz_idt(t_o))+Q_o(z_i(t-t_int))) * (1-exp((-g(z_i(t-t_int))*(t-t_o))/Q_o(z_i(t-t_int)))) - (Q_o(z_i(t-t_int))*t) + z_i(t_o));
    dx_idt = diff(x_i);
    dy_idt = diff(y_i);
    dz_idt = diff(z_i);
end

fplot(z_i,[0 1000],'Color','blue');
hold off;