% This script is automatically constructed by trajectory.m 

% No parachute... 
x_i(t) = (3.035*Q(6371070.0585))/g(6371070.0585) * (1-exp((-g(6371070.0585)*t)/Q(6371070.0585))) +3.1514;
y_i(t) = (5.67e-05*Q(6371070.0585))/g(6371070.0585) * (1-exp((-g(6371070.0585)*t)/Q(6371070.0585))) +1;
z_i(t) = piecewise((-1e-13<=t<0.6), (16.049/1.5712) * ((-1.2497)+16.049) * (1-exp((-1.5712*(t--1e-13))/16.049)) - (16.049*(t--1e-13)) +6371070.09);

dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);
