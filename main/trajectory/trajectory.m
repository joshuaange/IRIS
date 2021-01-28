% Parametric Trajectory
x_i = @(t) ((u_i(2,1)*Q)/g)*(1-exp((-g*t)/Q))+u_i(1,1);
y_i = @(t) ((u_i(2,2)*Q)/g)*(1-exp((-g*t)/Q))+u_i(1,2);
z_i = @(t) ((Q*(u_i(2,3)+Q))/g)*(1-exp((-g*t)/Q))-(t*Q)+u_i(1,3);

% Intersection Time
t_p_i = vpasolve(L(x_i(t),y_i(t))==z_i(t), t, [0, Inf]);
t_p_i = max(t_p_i);
if isempty(t_p_i) == 1
    display("! ! ! No Initial Impact Found ! ! !");
end

display("trajectory.m");