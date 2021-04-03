% Aligned pod coordinates of first impact
t_f_i = t_p_i;
display("-10 Interval");
for t_p = t_p_i:-10:t_p_min % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<s_min
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
            end
        end
    end
end
display("-1 Interval");
for t_p = t_f_i:-1:max(t_p_min, t_f_i-10) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<s_min
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
            end
        end
    end
end
display("-0.1 Interval");
for t_p = t_f_i:-0.1:max(t_p_min, t_f_i-1) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<s_min
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
            end
        end
    end
end
display(double(-t_step) + " Interval");
for t_p = t_f_i:-t_step:max(t_p_min, t_f_i-0.1) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<s_min
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
            end
        end
    end
end

% Find averaged impact point
display("Finding averaged impact point");
X_total = 0;
Y_total = 0;
Z_total = 0;
c = 0;
for m_A = 1:A_limit % Cycles through all discrete pod coordinate collisions
    for m_B = 1:B_limit
        if abs(L(X_i(m_A,m_B),Y_i(m_A,m_B))-Z_i(m_A,m_B))<s_min
            c = c+1;
            X_total = X_total+X_i(m_A,m_B);
            Y_total = Y_total+Y_i(m_A,m_B);
            Z_total = Z_total+Z_i(m_A,m_B);
        end
    end
end
% Impact
% Finds good average position for collision of pod with terrain
S_i = [(X_total/c),(Y_total/c),double(L((X_total/c),(Y_total/c)))];

display("pod.m");