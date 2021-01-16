% Graphing
domain = domainMin:domainInt:domainMax;
% Finds general conditions
[U, terminalVelocity, podPoisson, podMaterialProp, dLdx, dLdy, surfaceArea, StartingKE, EndingKE] = I_main(mass,gravity,airDensity,dragCoefficient,podYoungsMod,podModRigidity,L,velocityStart,diameter);
% Inter-iterative records
b = cell(iitMax,1);
s = cell(iitMax,jitMax);
% Resets 'Test Output'
writematrix("Test Output:",'Test Output');

% Graphing
figure_main = figure('Name','Trajectory','OuterPosition',[10 195 600 350]);
view(3);
fsurf(L,'DisplayName','Surface Topology','FaceAlpha',0.8);
hold on;

% On-ground iteration (iit)
for iit = 1:iitMax
    
    % Trajectory
    [xt, yt, zt, timeImpactFinal] = II_trajectory(velocityStart, terminalVelocity, gravity, L, minimumIgnore);
    % Shaped collision
    [timeImpact, X, Y, Z, C, x_limit, y_limit, XSphere, YSphere, ZSphere] = II_podCollision(L, diameter, xt, yt, zt, timeImpactFinal, minimumStep, minimumEqual, minimumIgnore);
    % Impact information
    [LostKE, dxt, dyt, dzt, velocityHit, S, quatV_ground, quatA_ground, EndingKE, TP] = II_impactInfo(x_limit, y_limit, C, xt, yt, zt, quatV_air, quatA_air, timeImpact, X, Y, Z, L, minimumEqual, EndingKE, HeatPercentage, TP, TCT);
    
    % Recording iteration data
    run('big');
    
    % DISPLAY
    writematrix("i = " + iit,'Test Output','WriteMode','append');
    
    % In-air iteration (jit)
    for jit = 1:jitMax
        
        % Directional/Planar setup
        [dLdxS, dLdyS, N, vec_N, vec_PN, vec_P, vec_B, mag, S_2, vec_O] = III_directions(L, S, velocityHit, T, dLdx, dLdy);
        % Pod equations
        [X_new, Y_new, Z_new, C_new, x_limit, y_limit, vec_OM, S_new, vec_N_new, X_newFinal, Y_newFinal, Z_newFinal, vec_M] = III_pod(C, vec_O, ZSphere, XSphere, YSphere, diameter, dLdx, dLdy, L, minimumEqual);
        % Reaction forces
        [vec_VE, vec_Norm, vec_VG, vec_VF, quatV_pInfluence, quatA_pInfluence, quatV_next, quatA_next, vec_rotVelocity] = III_reactions(S, T, gravity, velocityHit, jit, S_new, K, s, iit, minimumRestitution, KT, vec_O, F, dLdxS, dLdyS, R, mass, diameter, quatV_ground, quatA_ground, N, U, vec_N_new, L, mag, vec_P, minimumFlatness, vec_B, YM, G, podMaterialProp, vec_PN);
        % Final equations
        [LostKE, TE_avg, TC_avg, heatFlux, heatTransfer, areaGround, cooling, TP_new, velocityEnd, FI, deltalKE, deltaKE, Y_avg, G_avg, landPoisson, landMaterialProp, deformation, deltarKE, EndingKE, CollisionKelvin] = III_final(vec_Norm, S_new, velocityHit, vec_VR, vec_VF, vec_VG, mass, T, YM, G, diameter, podMaterialProp, S, TE, TC, heatCapacity, TP, vec_rotVelocity, momentOfInertia, quatA_next, quatA_ground, C_new, EndingKE, TCT, HeatPercentage, b, iit, jit, vec_VE, K);
        
        % Return
        ret = vpa(velocityEnd(2,3)+S_new(3)-L((velocityEnd(2,1)+S_new(1)),(velocityEnd(2,2)+S_new(2))));
        returnVelocity = vpa(vec_mag(velocityEnd));
        % Recording iteration data
        run('small');
        TP = s{iit,jit}.TP_new;
        
        if (-stopRange<returnVelocity) && (returnVelocity<+stopRange)
            writematrix("j (N) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
            writematrix("              velocityHit = " + double(vec_mag(velocityHit)),'Test Output','WriteMode','append');
            writematrix("              vec_VR = " + double(vec_mag(vec_VR)),'Test Output','WriteMode','append');
            writematrix("              vec_VF = " + double(vec_mag(vec_VF)),'Test Output','WriteMode','append');
            writematrix("              vec_VG = " + double(vec_mag(vec_VG)),'Test Output','WriteMode','append');
            writematrix("              vec_VE = " + double(vec_mag(vec_VE)),'Test Output','WriteMode','append');
            writematrix("             Spin = [ " + double(quatV_next(2,1)) + ", " + double(quatV_next(2,2)) + ", " + double(quatV_next(2,3)) + " ], " + double(quatA_next),'Test Output','WriteMode','append');
            writematrix("             POSITION = (" + double(vec_O(1,1)+vec_O(2,1)) + ", " + double(vec_O(1,2)+vec_O(2,2)) + ", " + double(vec_O(1,3)+vec_O(2,3)) + ")",'Test Output','WriteMode','append');
            break
        end
        if ret > minimumIgnoreIteration
            writematrix("j (Air) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
            writematrix("              New Temperature = " + double(TP),'Test Output','WriteMode','append');
            writematrix("              velocityHit = " + double(vec_mag(velocityHit)),'Test Output','WriteMode','append');
            writematrix("              vec_VR = " + double(vec_mag(vec_VR)),'Test Output','WriteMode','append');
            writematrix("              vec_VF = " + double(vec_mag(vec_VF)),'Test Output','WriteMode','append');
            writematrix("              vec_VG = " + double(vec_mag(vec_VG)),'Test Output','WriteMode','append');
            writematrix("              vec_VE = " + double(vec_mag(vec_VE)),'Test Output','WriteMode','append');
            writematrix("             Spin = [ " + double(quatV_next(2,1)) + ", " + double(quatV_next(2,2)) + ", " + double(quatV_next(2,3)) + " ], " + double(quatA_next),'Test Output','WriteMode','append');
            writematrix("             POSITION = (" + double(vec_O(1,1)+vec_O(2,1)) + ", " + double(vec_O(1,2)+vec_O(2,2)) + ", " + double(vec_O(1,3)+vec_O(2,3)) + ")",'Test Output','WriteMode','append');
            velocityStart = s{iit,jit}.velocityEnd;
            quatV_air = [s{iit,jit}.quatV_next(1,1) s{iit,jit}.quatV_next(1,2) s{iit,jit}.quatV_next(1,3); s{iit,jit}.quatV_next(2,1) s{iit,jit}.quatV_next(2,2) s{iit,jit}.quatV_next(2,3)];
            quatA_air = s{iit,jit}.quatA_next;
            break
        else
            writematrix("j (Ground) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
            writematrix("              New Temperature = " + double(TP),'Test Output','WriteMode','append');
            writematrix("              velocityHit = " + double(vec_mag(velocityHit)),'Test Output','WriteMode','append');
            writematrix("              vec_VR = " + double(vec_mag(vec_VR)),'Test Output','WriteMode','append');
            writematrix("              vec_VF = " + double(vec_mag(vec_VF)),'Test Output','WriteMode','append');
            writematrix("              vec_VG = " + double(vec_mag(vec_VG)),'Test Output','WriteMode','append');
            writematrix("              vec_VE = " + double(vec_mag(vec_VE)),'Test Output','WriteMode','append');
            writematrix("             Spin = [ " + double(quatV_next(2,1)) + ", " + double(quatV_next(2,2)) + ", " + double(quatV_next(2,3)) + " ], " + double(quatA_next),'Test Output','WriteMode','append');
            writematrix("             POSITION = (" + double(vec_O(1,1)+vec_O(2,1)) + ", " + double(vec_O(1,2)+vec_O(2,2)) + ", " + double(vec_O(1,3)+vec_O(2,3)) + ")",'Test Output','WriteMode','append');
            S = s{iit,jit}.S_new;
            C = s{iit,jit}.C_new;
            velocityHit = s{iit,jit}.velocityEnd;
            quatV_ground = [s{iit,jit}.quatV_next(1,1) s{iit,jit}.quatV_next(1,2) s{iit,jit}.quatV_next(1,3); s{iit,jit}.quatV_next(2,1) s{iit,jit}.quatV_next(2,2) s{iit,jit}.quatV_next(2,3)];
            quatA_ground = s{iit,jit}.quatA_next;
            if jit == jitMax
                writematrix("ERROR : not enough jit",'Test Output','WriteMode','append');
            end
        end
    end
    if (-stopRange<returnVelocity) && (returnVelocity<+stopRange)
            break
    end
end

writematrix("END",'Test Output','WriteMode','append');

% General Graphing
run('bigGraph');
run('smallGraph');
grid minor;
legend;
axis equal;
xlim([domainMin domainMax]);
ylim([domainMin domainMax]);
zlim([domainMin domainMax]);
hold off;
% Specific Graphs
run('posTime');
run('velTime');
run('KETime');
run('reactionTime');
run('temperatureTime');
run('deformationTime');
run('rotTime');

%Impact
%run('breaking');

display("END");