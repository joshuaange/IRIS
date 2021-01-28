% Parametric Trajectory
x_i = @(t) ((u_i(2,1)*Q)/g)*(1-exp((-g*t)/Q))+u_i(2,1);
y_i = @(t) ((u_i(2,2)*Q)/g)*(1-exp((-g*t)/Q))+u_i(2,2);
z_i = @(t) ((Q*(u_i(2,3)*Q))/g)*(1-exp((-g*t)/Q))-(t*Q)+u_i(2,3);

% Intersection Time
t_p_i = vpasolve(L(x_i(VAL),y_i(VAL))==z_i(VAL), VAL, [t_p_min, Inf]);
t_p_i = max(t_p_i);

display("trajectory.m");