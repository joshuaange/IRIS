% This script is automatically constructed by trajectory.m 

% No parachute... 
x_i(t) = (0*Q(1737135.91))/g(1737135.91) * (1-exp((-g(1737135.91)*t)/Q(1737135.91))) +-50;
y_i(t) = (50*Q(1737135.91))/g(1737135.91) * (1-exp((-g(1737135.91)*t)/Q(1737135.91))) +0;
z_i(t) = piecewise((-1e-13<=t<10000), (29.2671/1.6146) * ((10)+29.2671) * (1-exp((-1.6146*(t--1e-13))/29.2671)) - (29.2671*(t--1e-13)) +1737135.91);

dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);
