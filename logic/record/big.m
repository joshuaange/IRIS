b{iit}.u_i = double(u_i);
b{iit}.x_i = (x_i);
b{iit}.y_i = (y_i);
b{iit}.z_i = (z_i);
b{iit}.dx_idt = (dx_idt);
b{iit}.dy_idt = (dy_idt);
b{iit}.dz_idt = (dz_idt);
try
    b{iit}.z_iParachute = double(z_iParachute);
    b{iit}.t_A_velX = double(t_A_velX);
    b{iit}.x_iParachute = double(x_iParachute);
    b{iit}.t_A_velY = double(t_A_velY);
    b{iit}.y_iParachute = double(y_iParachute);
catch
end
b{iit}.t_f_i = double(t_f_i);
b{iit}.t_inter = double(t_inter);
b{iit}.t_p_min = double(t_p_min);
b{iit}.X_moved = double(X_moved);
b{iit}.Y_moved = double(Y_moved);
b{iit}.Z_moved = double(Z_moved);
b{iit}.C_i = double(C_i);
b{iit}.X_i = double(X_i);
b{iit}.Y_i = double(Y_i);
b{iit}.Z_i = double(Z_i);
b{iit}.X_total = double(X_total);
b{iit}.Y_total = double(Y_total);
b{iit}.Z_total = double(Z_total);
b{iit}.S_i = double(S_i);
b{iit}.dx2_idt = (dx2_idt);
b{iit}.dy2_idt = (dy2_idt);
b{iit}.dz2_idt = (dz2_idt);
b{iit}.v_i = double(v_i);
b{iit}.a_i = double(a_i);
b{iit}.KE_s_i = double(KE_s_i);
b{iit}.KE_f_i = double(KE_f_i);
b{iit}.q_i = double(q_i);
b{iit}.T_i = double(T_i);
display("big.m");