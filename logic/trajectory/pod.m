% Intersection Time of Trajectory
% Finding intersection point between trajectory and land (bearing in mind
% the limitations of L_min and L_max
GAP = abs(L(x_i((t_A_last + t_A_int - t_step)),y_i((t_A_last + t_A_int - t_step)))-z_i((t_A_last + t_A_int - t_step)));
if GAP < d/2
    GAP = d/2;
end
for t_p = (t_A_last + t_A_int - t_step):-t_int_step:0 %From bottom to 0
    display(double(t_p));
    if abs(L(x_i(t_p),y_i(t_p))-z_i(t_p)) < GAP
        display("Nearest Intersection! at " + double(t_p) + " at pos: " + double(z_i(t_p)));
        t_f_i = t_p; %Intersection point
        GAP = abs(L(x_i(t_p),y_i(t_p))-z_i(t_p));
    end
    if z_i(t_p) > L_max
        display("Terrain Maximum! at " + double(t_p));
        t_p_min = t_p; % Minimum value once time is above L_max
        break
    end
end

% In case below interval
if exist('t_p_min','var') == 0
    t_p_min = 0;
end
% If t_f_i and t_p_min should be the same
if exist('t_f_i','var') == 0
    t_f_i = t_p_min;
    abs(L(x_i(t_f_i),y_i(t_f_i))-z_i(t_f_i))
end
% GAP consideration
if GAP < d/2
    GAP = d/2;
end

% Collision Time of Pod Shape
% Moving from t_inter to t_p_min at increasingly smaller intervals to find
% pod collision point with terrain
t_inter = t_f_i;
t_move = t_stride; % "move" defines the interval
t_p_end = 0;
while t_p_end == 0
    % Runs through pod shape to find minimum impact points
    for t_p = min(t_inter,t_f_i+11*t_move):-t_move:max(t_p_min, t_f_i-11*t_move) % Cycles pod position from impact to starting value
        display(double(t_p));
        X_moved = X_sphere*(d/2)+x_i(t_p);
        Y_moved = Y_sphere*(d/2)+y_i(t_p);
        Z_moved = Z_sphere*(d/2)+z_i(t_p);
        for m_A = 1:A_limit % Cycles through all discrete pod coordinates
            for m_B = 1:B_limit
                if abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B))<=GAP
                    display("Collision! at " + double(t_p) + " at pos: " + double(m_A) + ", " + double(m_B));
                    C_i = [x_i(t_p),y_i(t_p),z_i(t_p)];
                    X_i = X_moved;
                    Y_i = Y_moved;
                    Z_i = Z_moved;
                    t_f_i = t_p; % Finds earliest collision time with pod
                    GAP = abs(L(X_moved(m_A,m_B),Y_moved(m_A,m_B))-Z_moved(m_A,m_B));
                    if GAP < d/2
                        GAP = d/2;
                    end
                    display("Collision Gap: " + double(GAP));
                end
            end
        end
    end
    % Reduces move interval
    if t_move <= t_step
        break
    else
        t_move = t_move/10;
    end
end

display("FINAL TIME VALUE: " + double(t_f_i));
display("FINAL GAP VALUE:  " + double(GAP));
% Warnings for if impacts cannot be found
if t_f_i == (t_A_last + t_A_int - t_step)
    display("! ! ! No Initial Impact Can Be Found ! ! !");
end
% if d/2 < GAP
%     display("! ! ! Impact is Not Small Enough ! ! !");
%     pause
% end

% Find averaged impact point
display("Finding averaged impact point");
X_total = 0;
Y_total = 0;
Z_total = 0;
c = 0;
for m_A = 1:A_limit % Cycles through all discrete pod coordinate collisions
    for m_B = 1:B_limit
        if abs(L(X_i(m_A,m_B),Y_i(m_A,m_B))-Z_i(m_A,m_B))<s_min
            display("Average Impact! at pos: " + double(m_A) + ", " + double(m_B));
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