% This script is automatically constructed by trajectory.m 

% No parachute... 
x_i(t) = (0*Q(6871000))/g(6871000) * (1-exp((-g(6871000)*t)/Q(6871000))) +-50;
y_i(t) = (50*Q(6871000))/g(6871000) * (1-exp((-g(6871000)*t)/Q(6871000))) +0;
z_i(t) = piecewise((-1e-13<=t<10000), (62.3858/7.3362) * ((50)+62.3858) * (1-exp((-7.3362*(t--1e-13))/62.3858)) - (62.3858*(t--1e-13)) +7371000, (10000<=t<20000), (68.1445/8.7531) * ((-62.3858)+68.1445) * (1-exp((-8.7531*(t-10000))/68.1445)) - (68.1445*(t-10000)) +6748097.649);

dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);

% Parachute... 
z_iParachute(t) = piecewise((10000<=t<20000), (9.8717/8.7531) * (((154179634647074457324*exp(-3938591990755161497706236346144/3349312134184960174560546875))/2743756500324319375 + (1028467978283331109*exp(-29870065894/232543979264375))/357187552150080000 - 9185253288133735/140737488355328)+9.8717) * (1-exp((-8.7531*(t-10000))/9.8717)) - (9.8717*(t-10000)) +1811428669541843/268435456, (20000<=t<30000), (10.0184/9.0151) * ((-9.8717)+10.0184) * (1-exp((-9.0151*(t-20000))/10.0184)) - (10.0184*(t-20000)) +6649320.9551, (30000<=t<40000), (10.1716/9.293) * ((-10.0184)+10.1716) * (1-exp((-9.293*(t-30000))/10.1716)) - (10.1716*(t-30000)) +6549137.1864, (40000<=t<50000), (10.3321/9.5886) * ((-10.1716)+10.3321) * (1-exp((-9.5886*(t-40000))/10.3321)) - (10.3321*(t-40000)) +6447420.8842);
z_i(t) = piecewise((t<=t_o), z_i(t),(t>t_o), z_iParachute(t));

t_A_velX = dx_idt(t_o); t_A_posX = x_i(t_o); %Start pos, vel, and time
% If lies at discontinuous point!
if isnan(t_A_velX) == 1
    t_A_velX = (dx_idt(t_o+0.001)+dx_idt(t_o-0.001))/2;
end
x_iParachute(t) = (t_A_velX*Q_o(z_i(t_o)))/g(z_i(t_o)) * (1-exp((-g(z_i(t_o))*t)/Q_o(z_i(t_o)))) + t_A_posX;
x_i(t) = piecewise((t<=t_o), x_i(t), (t>t_o), x_iParachute(t));
t_A_velY = dy_idt(t_o); t_A_posY = y_i(t_o); %Start pos, vel, and time
% If lies at discontinuous point!
if isnan(t_A_velY) == 1
    t_A_velY = (dy_idt(t_o+0.001)+dy_idt(t_o-0.001))/2;
end
y_iParachute(t) = (t_A_velY*Q_o(z_i(t_o)))/g(z_i(t_o)) * (1-exp((-g(z_i(t_o))*t)/Q_o(z_i(t_o)))) + t_A_posY;
y_i(t) = piecewise((t<=t_o), y_i(t), (t>t_o), y_iParachute(t));

dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);
