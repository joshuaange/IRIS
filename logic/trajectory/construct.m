% This script is automatically constructed by trajectory.m 

% No parachute... 
x_i(t) = (2.825*Q(-0.0125))/g(-0.0125) * (1-exp((-g(-0.0125)*t)/Q(-0.0125))) +0.011;
y_i(t) = (0*Q(-0.0125))/g(-0.0125) * (1-exp((-g(-0.0125)*t)/Q(-0.0125))) +1;
z_i(t) = piecewise((-1e-13<=t<0.01), (215261673.7038/282656050349030.5) * ((0)+215261673.7038) * (1-exp((-282656050349030.5*(t--1e-13))/215261673.7038)) - (215261673.7038*(t--1e-13)) +0.475);

dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);
