% Plotting
f1 = figure('Name','Terrain Data','OuterPosition',[10 550 600 350]);
view(3)
Lsurf = surf(xx,yy,L(xx,yy),'DisplayName','Surface Topology');
hold on
Ksurf = surf(xx,yy,K(xx,yy),'DisplayName','Spring Constant','FaceAlpha',0.5);
Fsurf = surf(xx,yy,F(xx,yy),'DisplayName','Coefficient of Friction','FaceAlpha',0.5);
Rsurf = surf(xx,yy,R(xx,yy),'DisplayName','Coefficient of Rolling Friction','FaceAlpha',0.5);
Ysurf = surf(xx,yy,Y(xx,yy),'DisplayName','Young''s Modulus','FaceAlpha',0.5);
Gsurf = surf(xx,yy,G(xx,yy),'DisplayName','Modulus of Rigidty','FaceAlpha',0.5);
surf(basex,basey,(0*basex+0*basey),'DisplayName','','LineStyle','--','FaceAlpha',0);
grid minor
legend([Lsurf Ksurf Fsurf Rsurf Ysurf Gsurf])
hold off

% Plotting Trajectory
f2 = figure('Name','Trajectory','OuterPosition',[10 195 600 350]);
view(3)
traj3 = fplot3(xt,yt,zt,[trajectorylengthmin trajectorylengthmax],'DisplayName','Trajectory','lineWidth',1,'Color','black');
hold on
trajV = quiver3(v_V(1,1),v_V(1,2),v_V(1,3),v_V(2,1),v_V(2,2),v_V(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Launch Velocity');
trajp = plot3(xt(t_i),yt(t_i),zt(t_i),'Marker','o','DisplayName','Point of Impact');
trajv = quiver3(v_v(1,1),v_v(1,2),v_v(1,3),v_v(2,1),v_v(2,2),v_v(2,3),'lineWidth',1,'Color','red','MaxHeadSize',0.5,'DisplayName','Impact Velocity');
Lsurf = surf(xx,yy,L(xx,yy),'DisplayName','Surface Topology','FaceAlpha',0.8);
xlim([domainmin domainmax])
ylim([domainmin domainmax])
zlim([domainmin domainmax])
grid minor
legend([Lsurf traj3 trajV trajv trajp])
hold off

% Plotting Trajectory
f3 = figure('Name','Mapping','OuterPosition',[610 400 750 500]);
view(3)
traj3 = fplot3(xt,yt,zt,[trajectorylengthmin trajectorylengthmax],'DisplayName','Trajectory','lineWidth',1,'Color','black');
hold on
trajV = quiver3(v_V(1,1),v_V(1,2),v_V(1,3),v_V(2,1),v_V(2,2),v_V(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Launch Velocity');
trajp = plot3(S(1),S(2),S(3),'Marker','o','DisplayName','Point of Segment Start');
trajv = quiver3(v_v(1,1),v_v(1,2),v_v(1,3),v_v(2,1),v_v(2,2),v_v(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.5,'DisplayName','Impact Velocity','LineStyle','--');
Lsurf = surf(xx,yy,L(xx,yy),'DisplayName','Surface Topology','FaceAlpha',0.8);
Nplane = surf(xx,yy,N(xx,yy),'DisplayName','Tangent Plane','FaceAlpha',0.25,'EdgeAlpha',0.25,'FaceColor','red');
Nvec = quiver3(v_N(1,1),v_N(1,2),v_N(1,3),v_N(2,1),v_N(2,2),v_N(2,3),'lineWidth',1,'Color','red','MaxHeadSize',0.5,'DisplayName','Normal Vector','LineStyle','--');
%[U,V,W] = surfnorm(xx,yy,L(xx,yy));
%quiver3(xx,yy,L(xx,yy),U,V,W,0.25)
Pvec = quiver3(v_P(1,1),v_P(1,2),v_P(1,3),v_P(2,1),v_P(2,2),v_P(2,3),'lineWidth',1,'Color','red','MaxHeadSize',0.2,'DisplayName','Parallel Vector');
Bvec = quiver3(v_B(1,1),v_B(1,2),v_B(1,3),v_B(2,1),v_B(2,2),v_B(2,3),'lineWidth',1,'Color','black','MaxHeadSize',0.2,'DisplayName','Perpendicular Vector');
trajp_2 = plot3(S_2(1),S_2(2),S_2(3),'Marker','s','DisplayName','Point of Segment End');
Ovec = quiver3(v_O(1,1),v_O(1,2),v_O(1,3),v_O(2,1),v_O(2,2),v_O(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.2,'DisplayName','Traced Segment Vector');
VRreac = quiver3(v_VR(1,1),v_VR(1,2),v_VR(1,3),v_VR(2,1),v_VR(2,2),v_VR(2,3),'DisplayName','Equal Reaction Vector','LineStyle','-.');
VGreac = quiver3(v_VG(1,1),v_VG(1,2),v_VG(1,3),v_VG(2,1),v_VG(2,2),v_VG(2,3),'DisplayName','Gravitational Reaction Vector','LineStyle','-.');
VEreac = quiver3(v_VE(1,1),v_VE(1,2),v_VE(1,3),v_VE(2,1),v_VE(2,2),v_VE(2,3),'DisplayName','Elasticity Reaction Vector','LineStyle','-.');
VFreac = quiver3(v_VF(1,1),v_VF(1,2),v_VF(1,3),v_VF(2,1),v_VF(2,2),v_VF(2,3),'DisplayName','Frictional Reaction Vector','LineStyle','-.');
trajVi_2 = quiver3(v_Vi_2(1,1),v_Vi_2(1,2),v_Vi_2(1,3),v_Vi_2(2,1),v_Vi_2(2,2),v_Vi_2(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','New Launch Velocity');
xlim([domainmin domainmax])
ylim([domainmin domainmax])
zlim([domainmin domainmax])
legend([Lsurf Nplane traj3 trajp trajp_2 trajV trajVi_2 trajv Nvec Pvec Bvec Ovec VRreac VGreac VEreac VFreac])
grid minor
hold off

% Display Variables
display("Impact Force: " + double(FI))
display("Change in KE: " + double(deltaKE))
display("Deformation: " + double(deformation))
if Ret > 0
    display("Return? Y (Air)")
else
    display("Return? Y (Ground)")
    if v_Vi_2mag == 0
        display("Return? N")
    end;
end;