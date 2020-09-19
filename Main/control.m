run('I_main.m');
big = cell(10,nitmax);
small = cell(57,nitmax,nitmax*iitmax);
nitstop = 0;
iitstop = 0;

for nit = 1:nitmax
    if nitstop == 1 
        display("nitstop " + nit);
    else
    syms x y t M Ret;
    run('II_main.m');
    run('recording_big.m');
    % Starting Conditions
    S = [xt(t_i) yt(t_i) zt(t_i)];
    v_Vi = v_v;
    display("n = " + nit);
    for iit = 1:iitmax
        if iitstop == 1
           % display("iitstop " + iit);
        else
        syms x y t M Ret;
        run('III_main.m');
        run('recording_small.m');
        v_V = small{46,nit,iit} ;
        if Ret > 0
            v_V = small{46,nit,iit};
            display("i (Air) = " + iit + " Velocity: " + double(small{47,nit,iit}));
            % display("Return? Y (Air)");
            iitstop = 1;
        else
            v_Vi = small{46,nit,iit};
            S = small{26,nit,iit};
            display("i (Ground) = " + iit + " Velocity: " + double(small{47,nit,iit}));
            % display("Return? Y (Ground)");
            if (0-stop_interval<v_Vi_2mag) && (v_Vi_2mag<0+stop_interval)
                display("i (N) = " + iit + " Velocity: " + double(small{47,nit,iit}));
                % display("Return? N");
                iitstop = 1;
                nitstop = 1;
            end;
        end;
    end;
    end;
    iitstop = 0;
end;
end;

display("END");