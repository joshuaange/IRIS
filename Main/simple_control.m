run('I_main.m');

run('II_main.m');

% Starting Conditions
S = [xt(t_i) yt(t_i) zt(t_i)];
v_Vi = v_v;

run('III_main.m');

run('simple_graphing.m')