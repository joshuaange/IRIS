 % Trajectory Functions
xt = @(t) v_V(2,1)*(Q/g)*(1-exp(-(g*t)/Q))+v_V(1,1);
yt = @(t) v_V(2,2)*(Q/g)*(1-exp(-(g*t)/Q))+v_V(1,2);
zt = @(t) (Q/g)*(v_V(2,3)+Q)*(1-exp(-(g*t)/Q))-(Q*t)+v_V(1,3);

% Finding time of impact
time_equation = L(xt(t),yt(t)) == zt(t);
t_i = vpasolve(time_equation, t, [0, Inf]);

% Finding velocity of impact
dxt = matlabFunction(diff(xt(t)));
dyt = matlabFunction(diff(yt(t)));
dzt = matlabFunction(diff(zt(t)));
v_v = [xt(t_i) yt(t_i) zt(t_i) ; dxt(t_i) dyt(t_i) dzt(t_i)];