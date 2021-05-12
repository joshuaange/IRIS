% Intersection Time of Pod Shape
% Finding intersection point between trajectory and land, we must use this
% search algorithm because the terrain utilizes bicubic interpolation with
% the heightmap rather than a continuous function
t_f_i = t_p_max;
GAP = abs(L(x_i(t_f_i),y_i(t_f_i))-z_i(t_f_i));
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
end

if t_step <= 10
display("-10 Interval");
for t_p = min(t_p_max,t_f_i+110):-10:max(t_p_min, t_f_i-110) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end

if t_step <= 1
display("-1 Interval");
for t_p = min(t_p_max,t_f_i+11):-1:max(t_p_min, t_f_i-11) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end

if t_step <= 0.1
display("-0.1 Interval");
for t_p = min(t_p_max,t_f_i+1.1):-0.1:max(t_p_min, t_f_i-1.1) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end

if t_step <= 0.01
display("-0.01 Interval");
for t_p = min(t_p_max,t_f_i+0.11):-0.01:max(t_p_min, t_f_i-0.11) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end

if t_step <= 0.001
display("-0.001 Interval");
for t_p = min(t_p_max,t_f_i+0.011):-0.001:max(t_p_min, t_f_i-0.011) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end

if t_step <= 0.0001
display("-0.0001 Interval");
for t_p = min(t_p_max,t_f_i+0.0011):-0.0001:max(t_p_min, t_f_i-0.0011) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end

if t_step <= 0.00001
display("-0.00001 Interval");
for t_p = min(t_p_max,t_f_i+0.00011):-0.00001:max(t_p_min, t_f_i-0.00011) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end

if t_step <= 0.000001
display("-0.000001 Interval");
for t_p = min(t_p_max,t_f_i+0.000011):-0.000001:max(t_p_min, t_f_i-0.000011) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end

if t_step < 0.000001
display(t_step + " Interval! (minimum value)");
for t_p = min(t_p_max,t_f_i+0.0000011):-t_step:max(t_p_min, t_f_i-0.0000011) % Cycles pod position from impact to starting value
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
                display("Collision Gap: " + double(GAP));
            end
        end
    end
    end
end
end
end
end
end
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
S_i = [(X_total/c),(Y_total/c),L((X_total/c),(Y_total/c))];

display("pod.m");