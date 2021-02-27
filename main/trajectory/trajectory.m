% Parametric Trajectory
x_i = @(t) (u_i(2,1)*Q)/g * (1-exp((-g*t)/Q)) + u_i(1,1);
y_i = @(t) (u_i(2,2)*Q)/g * (1-exp((-g*t)/Q)) + u_i(1,2);
z_i = @(t) (Q/g) * (u_i(2,3)+Q) * (1-exp((-g*t)/Q)) - (Q*t) + u_i(1,3);

% Intersection Time
GAP = abs(L(x_i(t_p_min),y_i(t_p_min))-z_i(t_p_min));
t_p_i = t_p_min;
display("Intersection Test 1:  " + double(t_p_i) + " : 100 : " + double(t_p_max));
for t_testone = t_p_i:100:t_p_max
    display("                    " + double(t_testone));
    if abs(L(x_i(t_testone),y_i(t_testone))-z_i(t_testone)) < GAP
        GAP = abs(L(x_i(t_testone),y_i(t_testone))-z_i(t_testone));
        t_p_i = t_testone;
        display("Successful Test 1:  " + t_testone + ", Gap: " + GAP);
    end
end
display("Intersection Test 2:  " + double(t_p_i-50) + " : 1 : " + double(t_p_i+50));
for t_testtwo =t_p_i-50:1:t_p_i+50
    display("                    " + double(t_testtwo));
    if abs(L(x_i(t_testtwo),y_i(t_testtwo))-z_i(t_testtwo)) < GAP
        GAP = abs(L(x_i(t_testtwo),y_i(t_testtwo))-z_i(t_testtwo));
        t_p_i = t_testtwo;
        display("Successful Test 2:  " + t_testtwo + ", Gap: " + GAP);
    end
end
display("Intersection Test 3:  " + double(t_p_i-5) + " : 0.1 : " + double(t_p_i+5));
for t_testthree = t_p_i-5:0.1:t_p_i+5
    display("                    " + double(t_testthree));
    if abs(L(x_i(t_testthree),y_i(t_testthree))-z_i(t_testthree)) < GAP
        GAP = abs(L(x_i(t_testthree),y_i(t_testthree))-z_i(t_testthree));
        t_p_i = t_testthree;
        display("Successful Test 3:  " + t_testthree + ", Gap: " + GAP);
    end
end
display("Intersection Test 4:  " + double(t_p_i-0.5) + " : 0.01 : " + double(t_p_i+0.5));
for t_testfour = t_p_i-0.5:0.01:t_p_i+0.5
    display("                    " + double(t_testfour));
    if abs(L(x_i(t_testfour),y_i(t_testfour))-z_i(t_testfour)) < GAP
        GAP = abs(L(x_i(t_testfour),y_i(t_testfour))-z_i(t_testfour));
        t_p_i = t_testfour;
        display("Successful Test 4:  " + t_testfour + ", Gap: " + GAP);
    end
end
display("Intersection Test 5:  " + double(t_p_i-0.05) + " : 0.001 : " + double(t_p_i+0.05));
for t_testfive = t_p_i-0.05:0.001:t_p_i+0.05
    display("                    " + double(t_testfive));
    if abs(L(x_i(t_testfive),y_i(t_testfive))-z_i(t_testfive)) < GAP
        GAP = abs(L(x_i(t_testfive),y_i(t_testfive))-z_i(t_testfive));
        t_p_i = t_testfive;
        display("Successful Test 5:  " + t_testfive + ", Gap: " + GAP);
    end
end
display("Intersection Test 6:  " + double(t_p_i-0.005) + " : 0.0001 : " + double(t_p_i+0.005));
for t_testsix = t_p_i-0.005:0.0001:t_p_i+0.005
    display("                    " + double(t_testsix));
    if abs(L(x_i(t_testsix),y_i(t_testsix))-z_i(t_testsix)) < GAP
        GAP = abs(L(x_i(t_testsix),y_i(t_testsix))-z_i(t_testsix));
        t_p_i = t_testsix;
        display("Successful Test 6:  " + t_testsix + ", Gap: " + GAP);
    end
end
display("Intersection Test 7:  " + double(t_p_i-0.0005) + " : 0.00001 : " + double(t_p_i+0.0005));
for t_testseven = t_p_i-0.0005:0.00001:t_p_i+0.0005
    display("                    " + double(t_testseven));
    if abs(L(x_i(t_testseven),y_i(t_testseven))-z_i(t_testseven)) < GAP
        GAP = abs(L(x_i(t_testseven),y_i(t_testseven))-z_i(t_testseven));
        t_p_i = t_testseven;
        display("Successful Test 7:  " + t_testseven + ", Gap: " + GAP);
    end
end
display("Intersection Test 8:  " + double(t_p_i-0.00005) + " : 0.000001 : " + double(t_p_i+0.00005));
for t_testeight = t_p_i-0.00005:0.000001:t_p_i+0.00005
    display("                    " + double(t_testeight));
    if abs(L(x_i(t_testeight),y_i(t_testeight))-z_i(t_testeight)) < GAP
        GAP = abs(L(x_i(t_testeight),y_i(t_testeight))-z_i(t_testeight));
        t_p_i = t_testeight;
        display("Successful Test 8:  " + t_testeight + ", Gap: " + GAP);
    end
end
display("Intersection Test 9:  " + double(t_p_i-0.000005) + " : 0.0000001 : " + double(t_p_i+0.000005));
for t_testnine = t_p_i-0.000005:0.0000001:t_p_i+0.000005
    display("                    " + double(t_testnine));
    if abs(L(x_i(t_testnine),y_i(t_testnine))-z_i(t_testnine)) < GAP
        GAP = abs(L(x_i(t_testnine),y_i(t_testnine))-z_i(t_testnine));
        t_p_i = t_testnine;
        display("Successful Test 9:  " + t_testnine + ", Gap: " + GAP);
    end
end
display("Intersection Test 10: " + double(t_p_i-0.0000005) + " : " + t_p_min + " : " + double(t_p_i+0.0000005));
for t_testten = t_p_i-0.0000005:t_p_min:t_p_i+0.0000005
    display("                    " + double(t_testten));
    if abs(L(x_i(t_testten),y_i(t_testten))-z_i(t_testten)) < GAP
        GAP = abs(L(x_i(t_testten),y_i(t_testten))-z_i(t_testten));
        t_p_i = t_testten;
        display("Successful Test 10: " + t_testten + ", Gap: " + GAP);
    end
end

display("GAP VALUE: " + GAP + "m");
display("TIME VALUE: " + t_p_i + "s");

if s_min < GAP
    display("! ! ! Impact is Not Small Enough ! ! !");
    pause
end
if isempty(t_p_i) == 1
    display("! ! ! No Initial Impact Can Be Found ! ! !");
    pause
end

display("trajectory.m");
