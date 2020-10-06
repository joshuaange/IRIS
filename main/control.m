% Graphing
domain = domainMin:domainInt:domainMax;
[xx,yy] = meshgrid(domain,domain);
% Dummy unit vector
U = [0 0 0 ; 0 0 1];
% Finds general conditions
[terminalVelocity, podPoisson, podMaterialProp, dLdx, dLdy] = I_main(mass,gravity,airDensity,surfaceArea,dragCoefficient,podYoungsMod,podModRigidity,L);
% Inter-iterative records
b = cell(iitMax,1);
s = cell(iitMax,jitMax);

% On-ground iteration (iit)
for iit = 1:iitMax
    
    % In-air calculations
    [xt, yt, zt, timeImpact, dxt, dyt, dzt, velocityHit] = II_main(velocityStart, terminalVelocity, gravity, L);
    S = [xt(timeImpact) yt(timeImpact) zt(timeImpact)];
    
    % Recording iteration data
    run('big');
    
    % DISPLAY
    A = "i = " + iit;
    writematrix(A,'Test Output','WriteMode','append');
    % display("i = " + iit);
    % DISPLAY
    
    % In-air iteration (jit)
    for jit = 1:jitMax
        
        % Directional/Planar setup
        [dLdxS, dLdyS, N, vec_N, vec_PN, vec_P, vec_B, mag, S_2, vec_O] = III_directions(L, S, velocityHit, T, dLdx, dLdy);
        % Reaction forces
        [vec_VR, vec_VG, K_avg, DV, vec_VE, vec_BG, F_avg, FJ, vec_VF] = III_reactions(S, T, velocityHit, mass, gravity, K, F, dLdxS, dLdyS, S_2, vec_O);
        % Final equations
        [velocityEnd, FI, deltalKE, deltaKE, Y_avg, G_avg, landPoisson, landMaterialProp, deformation] = III_final(S_2, velocityHit, vec_VR, vec_VF, vec_VG, vec_VE, mass, T, Y, G, diameter, podMaterialProp, S);
        
        % Return
        ret = vpa(velocityEnd(2,3)+S_2(3)-L((velocityEnd(2,1)+S_2(1)),(velocityEnd(2,2)+S_2(2))));
        
        % Recording iteration data
        run('small');
        
        if (-stopRange<vec_mag(velocityEnd)) && (vec_mag(velocityEnd)<+stopRange)
            % DISPLAY
            D = "j (N) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd));
            writematrix(D,'Test Output','WriteMode','append');
            % display("j (N) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)));
            % DISPLAY
            break
        end;
        if ret > 0
            velocityStart = s{iit,jit}.velocityEnd;
            % DISPLAY
            B = "j (Air) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd));
            writematrix(B,'Test Output','WriteMode','append');
            % display("j (Air) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)));
            % DISPLAY
            break
        else
            velocityHit = s{iit,jit}.velocityEnd;
            S = s{iit,jit}.S_2;
            % DISPLAY
            C = "j (Ground) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd));
            writematrix(C,'Test Output','WriteMode','append');
            % display("j (Ground) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)));
            % DISPLAY
        end;
        
    end;
    if (-stopRange<vec_mag(velocityEnd)) && (vec_mag(velocityEnd)<+stopRange)
            break
    end;
end;

E = "END";
writematrix(E,'Test Output','WriteMode','append');
display("END");