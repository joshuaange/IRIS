% Graphing
domain = domainmin:domainint:domainmax;
[basex,basey] = meshgrid(domainmin:domainmax,domainmin:domainmax);
[xx,yy] = meshgrid(domain,domain);

% General
Q = sqrt((2*m*g)/(rho*A*C_d));
U = [0 0 0 ; 0 0 1];
sigma_p = (Y_p)/(2*G_p-1);
mat_p = (1-sigma_p^2)/(pi*Y_p);