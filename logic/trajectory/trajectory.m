% Parametric Trajectory
display("Generating parametric trajectory curve");
x_i(t) = (u_i(2,1)*Q)/g * (1-exp((-g*t)/Q)) + u_i(1,1);
y_i(t) = (u_i(2,2)*Q)/g * (1-exp((-g*t)/Q)) + u_i(1,2);
z_i(t) = (Q/g) * (u_i(2,3)+Q) * (1-exp((-g*t)/Q)) - (Q*t) + u_i(1,3);
dx_idt = diff(x_i);
dy_idt = diff(y_i);
dz_idt = diff(z_i);
if iit == 1
    % Parachute changes terminal velocity to Q_o at t_o
    x_i(t) = piecewise((0<=t<t_o), x_i(t), (t>=t_o), (dx_idt(t_o)*Q_o)/g * (1-exp((-g*(t-t_o))/Q_o)) + x_i(t_o));
    y_i(t) = piecewise((0<=t<t_o), y_i(t), (t>=t_o), (dy_idt(t_o)*Q_o)/g * (1-exp((-g*(t-t_o))/Q_o)) + y_i(t_o));
    z_i(t) = piecewise((0<=t<t_o), z_i(t), (t>=t_o), (Q_o/g) * (dz_idt(t_o)+Q_o) * (1-exp((-g*(t-t_o))/Q_o)) - (Q_o*(t-t_o)) + z_i(t_o));
    dx_idt = diff(x_i);
    dy_idt = diff(y_i);
    dz_idt = diff(z_i);
end

% Intersection Time
GAP = abs(L(x_i(t_p_min),y_i(t_p_min))-z_i(t_p_min));
display("Default Time: " + double(t_p_min));
display("Default Gap:  " + double(GAP));
t_p_i = t_p_min;
for t_testone = t_p_i:100:t_p_max
    display("Intersection Time 1:  " + double(t_testone));
    if abs(L(x_i(t_testone),y_i(t_testone))-z_i(t_testone)) < GAP
        GAP = abs(L(x_i(t_testone),y_i(t_testone))-z_i(t_testone));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testone;
    end
end
for t_testtwo =t_p_i-100:1:t_p_i+100
    display("Intersection Time 2:  " + double(t_testtwo));
    if abs(L(x_i(t_testtwo),y_i(t_testtwo))-z_i(t_testtwo)) < GAP
        GAP = abs(L(x_i(t_testtwo),y_i(t_testtwo))-z_i(t_testtwo));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testtwo;
    end
end
for t_testthree = t_p_i-5:0.1:t_p_i+5
    display("Intersection Time 3:  " + double(t_testthree));
    if abs(L(x_i(t_testthree),y_i(t_testthree))-z_i(t_testthree)) < GAP
        GAP = abs(L(x_i(t_testthree),y_i(t_testthree))-z_i(t_testthree));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testthree;
    end
end
for t_testfour = t_p_i-0.5:0.01:t_p_i+0.5
    display("Intersection Time 4:  " + double(t_testfour));
    if abs(L(x_i(t_testfour),y_i(t_testfour))-z_i(t_testfour)) < GAP
        GAP = abs(L(x_i(t_testfour),y_i(t_testfour))-z_i(t_testfour));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testfour;
    end
end
for t_testfive = t_p_i-0.05:0.001:t_p_i+0.05
    display("Intersection Time 5:  " + double(t_testfive));
    if abs(L(x_i(t_testfive),y_i(t_testfive))-z_i(t_testfive)) < GAP
        GAP = abs(L(x_i(t_testfive),y_i(t_testfive))-z_i(t_testfive));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testfive;
    end
end
for t_testsix = t_p_i-0.005:0.0001:t_p_i+0.005
    display("Intersection Time 6:  " + double(t_testsix));
    if abs(L(x_i(t_testsix),y_i(t_testsix))-z_i(t_testsix)) < GAP
        GAP = abs(L(x_i(t_testsix),y_i(t_testsix))-z_i(t_testsix));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testsix;
    end
end
for t_testseven = t_p_i-0.0005:0.00001:t_p_i+0.0005
    display("Intersection Time 7:  " + double(t_testseven));
    if abs(L(x_i(t_testseven),y_i(t_testseven))-z_i(t_testseven)) < GAP
        GAP = abs(L(x_i(t_testseven),y_i(t_testseven))-z_i(t_testseven));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testseven;
    end
end
for t_testeight = t_p_i-0.00005:0.000001:t_p_i+0.00005
    display("Intersection Time 8:  " + double(t_testeight));
    if abs(L(x_i(t_testeight),y_i(t_testeight))-z_i(t_testeight)) < GAP
        GAP = abs(L(x_i(t_testeight),y_i(t_testeight))-z_i(t_testeight));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testeight;
    end
end
for t_testnine = t_p_i-0.000005:0.0000001:t_p_i+0.000005
    display("Intersection Time 9:  " + double(t_testnine));
    if abs(L(x_i(t_testnine),y_i(t_testnine))-z_i(t_testnine)) < GAP
        GAP = abs(L(x_i(t_testnine),y_i(t_testnine))-z_i(t_testnine));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testnine;
    end
end
for t_testten = t_p_i-0.0000005:t_p_min:t_p_i+0.0000005
    display("Intersection Time 10: " + double(t_testten));
    if abs(L(x_i(t_testten),y_i(t_testten))-z_i(t_testten)) < GAP
        GAP = abs(L(x_i(t_testten),y_i(t_testten))-z_i(t_testten));
        display("Success! (GAP):  " + double(GAP));
        t_p_i = t_testten;
    end
end

display("FINAL TIME VALUE: " + double(t_p_i));
display("FINAL GAP VALUE:  " + double(GAP));

if s_min < GAP
    display("! ! ! Impact is Not Small Enough ! ! !");
    pause
end
if isempty(t_p_i) == 1
    display("! ! ! No Initial Impact Can Be Found ! ! !");
    pause
end

display("trajectory.m");