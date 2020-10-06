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
    [xt, yt, zt, timeImpact, dxt, dyt, dzt, velocityHit] = II_main(velocityStart, terminalVelocity, gravity, L, minimumIgnore);
    S = [xt(timeImpact) yt(timeImpact) zt(timeImpact)];
    
    % Recording iteration data
    run('big');
    
    % DISPLAY
    writematrix("i = " + iit,'Test Output','WriteMode','append');
    
    % In-air iteration (jit)
    for jit = 1:jitMax
        
%         % EXPERIMENTAL v v %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%         Y_avgtest = (Y(S(1),S(2)));
%         G_avgtest = (G(S(1),S(2)));
%         landPoissontest = (Y_avgtest)/(2*G_avgtest-1);
%         landMaterialProptest = (1-landPoissontest^2)/(pi*Y_avgtest);
%         
%         syms TT Tt;
%         
%         %EWTEST = double((Y_avgtest*podYoungsMod)/(((podYoungsMod)-(podYoungsMod*(landPoissontest^2)))+((Y_avgtest)-(Y_avgtest*(podPoisson^2)))));
%         EWTEST = 0.8*10^6.1;
%         
%         %1.1.2
%         %timeEquationTest = 1000*(((3^(2/3))*((mass*(vec_mag(velocityHit)/TT)))^(2/3))/((4^(2/3))*((EWTEST)^(2/3))*(diameter/2)^(1/3)))==((((3*pi/2)^2/3)*(101.97*(mass*(vec_mag(velocityHit)/TT)))^2/3*(landMaterialProptest+podMaterialProp)^2/3*(1/(1000*diameter)))^1/3)/1000;
%         %1.0.1
%         timeEquationTest = (((3^(2/5))*((mass*(vec_mag(velocityHit)/TT)))*2^(1/5))/((4^(2/5))*((EWTEST)^(2/5))*(diameter)^(1/5)))==((((3*pi/2)^2/3)*(101.97*(mass*(vec_mag(velocityHit)/TT)))^2/3*(landMaterialProptest+podMaterialProp)*(1/(1000*diameter)))^1/3)/1000;
%         
%         Tt = vpasolve(timeEquationTest, TT);
%         T = Tt + EWTEST*Tt;
%         
%         % EXPERIMENTAL ^ ^ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
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
            writematrix("j (N) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
            break
        end;
        if ret > 0
            velocityStart = s{iit,jit}.velocityEnd;
            writematrix("j (Air) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
            break
        else
            velocityHit = s{iit,jit}.velocityEnd;
            S = s{iit,jit}.S_2;
            writematrix("j (Ground) = " + jit + ", Velocity: " + double(vec_mag(velocityEnd)),'Test Output','WriteMode','append');
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
xlim([domainMin domainMax]);
ylim([domainMin domainMax]);
zlim([domainMin domainMax]);
grid minor;
%legend([surf_L curve_trajectory vec_velocityStart vec_velocityHit point_impact]);
hold off;

display("END");