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
% Resets 'Test Output'
writematrix("Test Output:",'Test Output');

% On-ground iteration (iit)
for iit = 1:iitMax
    
    % In-air calculations
    [xt, yt, zt, timeImpact, dxt, dyt, dzt, velocityHit, S] = II_main(velocityStart, terminalVelocity, gravity, L, minimumIgnore);
    
    % Recording iteration data
    run('big');
    
    % DISPLAY
    writematrix("i = " + iit,'Test Output','WriteMode','append');
    
    % In-air iteration (jit)
    for jit = 1:jitMax
        
        % Directional/Planar setup
        [dLdxS, dLdyS, N, vec_N, vec_PN, vec_P, vec_B, mag, S_2, vec_O] = III_directions(L, S, velocityHit, T, dLdx, dLdy);
        % Reaction forces
        [vec_VR, vec_VG, K_avg, vec_VE, vec_BG, F_avg, FJ, vec_VF] = III_reactions(S, T, velocityHit, mass, gravity, K, F, dLdxS, dLdyS, S_2, vec_O);
        % Final equations
        [TE_avg, TC_avg, heatFlux, heatTransfer, areaGround, cooling, TP_new, velocityEnd, FI, deltalKE, deltaKE, Y_avg, G_avg, landPoisson, landMaterialProp, deformation] = III_final(S_2, velocityHit, vec_VR, vec_VF, vec_VG, vec_VE, mass, T, Y, G, diameter, podMaterialProp, S, TE, TC, heatCapacity, TP);
        
        % Return
        ret = vpa(velocityEnd(2,3)+S_2(3)-L((velocityEnd(2,1)+S_2(1)),(velocityEnd(2,2)+S_2(2))));
        
        % Recording iteration data
        run('small');
        TP = s{iit,jit}.TP_new;
        
        if (-stopRange<vec_mag(velocityEnd)) && (vec_mag(velocityEnd)<+stopRange)
            writematrix("j (N) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
            writematrix("              End Temperature = " + double(TP),'Test Output','WriteMode','append');
            break
        end;
        if ret > minimumIgnore
            writematrix("j (Air) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
            writematrix("              New Temperature = " + double(TP),'Test Output','WriteMode','append');
            
                            % SEE OTHER VALUES
        writematrix("              velocityHit = " + double(vec_mag(velocityHit)),'Test Output','WriteMode','append');
        writematrix("              vec_VR = " + double(vec_mag(vec_VR)),'Test Output','WriteMode','append');
        writematrix("              vec_VF = " + double(vec_mag(vec_VF)),'Test Output','WriteMode','append');
        writematrix("              vec_VG = " + double(vec_mag(vec_VG)),'Test Output','WriteMode','append');
        writematrix("              vec_VE = " + double(vec_mag(vec_VE)),'Test Output','WriteMode','append');
        writematrix("              POSITION = (" + double(vec_O(1,1)+vec_O(2,1)) + ", " + double(vec_O(1,2)+vec_O(2,2)) + ", " + double(vec_O(1,3)+vec_O(2,3)) + ")",'Test Output','WriteMode','append');

            velocityStart = s{iit,jit}.velocityEnd;
            
            break
        else
            S = s{iit,jit}.S_2;
            writematrix("j (Ground) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
            writematrix("              New Temperature = " + double(TP),'Test Output','WriteMode','append');
                    
                            % SEE OTHER VALUES
        writematrix("              velocityHit = " + double(vec_mag(velocityHit)),'Test Output','WriteMode','append');
        writematrix("              vec_VR = " + double(vec_mag(vec_VR)),'Test Output','WriteMode','append');
        writematrix("              vec_VF = " + double(vec_mag(vec_VF)),'Test Output','WriteMode','append');
        writematrix("              vec_VG = " + double(vec_mag(vec_VG)),'Test Output','WriteMode','append');
        writematrix("              vec_VE = " + double(vec_mag(vec_VE)),'Test Output','WriteMode','append');
        writematrix("              POSITION = (" + double(vec_O(1,1)+vec_O(2,1)) + ", " + double(vec_O(1,2)+vec_O(2,2)) + ", " + double(vec_O(1,3)+vec_O(2,3)) + ")",'Test Output','WriteMode','append');

            velocityHit = s{iit,jit}.velocityEnd;
        
        end;
        
    end;
    if (-stopRange<vec_mag(velocityEnd)) && (vec_mag(velocityEnd)<+stopRange)
            break
    end;
end;

writematrix("END",'Test Output','WriteMode','append');

%Graphing
figure_main = figure('Name','Trajectory','OuterPosition',[10 195 600 350]);
view(3);
surf(xx,yy,L(xx,yy),'DisplayName','Surface Topology','FaceAlpha',0.8);
hold on;
run('bigGraph');
run('smallGraph');
xlim([domainMin domainMax]);
ylim([domainMin domainMax]);
zlim([domainMin domainMax]);
grid minor;
%legend([surf_L curve_trajectory vec_velocityStart vec_velocityHit point_impact]);
hold off;

display("END");