% Intersection Time of Pod Shape
% Finding intersection point between trajectory and land, we must use this
% search algorithm because the terrain utilizes bicubic interpolation with
% the heightmap rather than a continuous function
t_f_i = t_p_max;
GAP = abs(L(x_i(t_f_i),y_i(t_f_i))-z_i(t_f_i));;
display("Default Time: " + double(t_f_i));
display("Default Gap:  " + double(GAP));
display("-100 Interval");
for t_p = t_p_max:-100:t_p_min % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("-10 Interval");
for t_p = t_f_i+60:-10:max(t_p_min, t_f_i-60) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("-1 Interval");
for t_p = t_f_i+6:-1:max(t_p_min, t_f_i-6) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("-0.1 Interval");
for t_p = t_f_i+0.6:-0.1:max(t_p_min, t_f_i-0.6) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("-0.01 Interval");
for t_p = t_f_i+0.06:-0.01:max(t_p_min, t_f_i-0.06) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("-0.001 Interval");
for t_p = t_f_i+0.006:-0.001:max(t_p_min, t_f_i-0.006) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("-0.0001 Interval");
for t_p = t_f_i+0.0006:-0.0001:max(t_p_min, t_f_i-0.0006) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("-0.00001 Interval");
for t_p = t_f_i+0.00006:-0.00001:max(t_p_min, t_f_i-0.00006) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("-0.000001 Interval");
for t_p = t_f_i+0.000006:-0.000001:max(t_p_min, t_f_i-0.000006) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display(t_step + " Interval! (minimum value)");
for t_p = t_f_i+0.0000006:-t_step:max(t_p_min, t_f_i-0.0000006) % Cycles pod position from impact to starting value
    display(double(t_p));
    X_moved = X_sphere*(d/2)+x_i(t_p);
    Y_moved = Y_sphere*(d/2)+y_i(t_p);
    Z_moved = Z_sphere*(d/2)+z_i(t_p);
    for m_A = 1:A_limit % Cycles through all discrete pod coordinates
        for m_B = 1:B_limit
            if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<GAP
                display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                X_i = X_moved;
                Y_i = Y_moved;
                Z_i = Z_moved;
                t_f_i = t_p; % Finds earliest collision time with pod
                GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
            end
        end
    end
end
display("FINAL TIME VALUE: " + double(t_f_i));
display("FINAL GAP VALUE:  " + double(GAP));
% Warnings for if impacts cannot be found
if t_f_i == t_p_max
    display("! ! ! No Initial Impact Can Be Found ! ! !");
    pause
end
if s_min < GAP
    display("! ! ! Impact is Not Small Enough ! ! !");
    pause
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