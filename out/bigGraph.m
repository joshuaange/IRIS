for iit = 1:iitMax
    if isempty(b{iit}) == 0
        fplot3(b{iit}.xt,b{iit}.yt,b{iit}.zt,[trajectoryMin trajectoryMax],'DisplayName','Trajectory','lineWidth',1,'Color','black');
        quiver3(b{iit}.velocityStart(1,1),b{iit}.velocityStart(1,2),b{iit}.velocityStart(1,3),b{iit}.velocityStart(2,1),b{iit}.velocityStart(2,2),b{iit}.velocityStart(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Launch Velocity');
        plot3(b{iit}.velocityHit(1,1),b{iit}.velocityHit(1,2),b{iit}.velocityHit(1,3),'Marker','o','DisplayName','Impact Point');
        quiver3(b{iit}.velocityHit(1,1),b{iit}.velocityHit(1,2),b{iit}.velocityHit(1,3),b{iit}.velocityHit(2,1),b{iit}.velocityHit(2,2),b{iit}.velocityHit(2,3),'lineWidth',1,'Color','red','MaxHeadSize',0.5,'DisplayName','Impact Velocity');
        plot3(b{iit}.velocityStart(1,1),b{iit}.velocityStart(1,2),b{iit}.velocityStart(1,3),'Marker','x','DisplayName','Start Point','Color','green');
        quiver3(b{iit}.quatV_air(1,1),b{iit}.quatV_air(1,2),b{iit}.quatV_air(1,3),b{iit}.quatV_air(2,1),b{iit}.quatV_air(2,2),b{iit}.quatV_air(2,3),'lineWidth',0.5,'Color','white','MaxHeadSize',0.1,'DisplayName','Quaternion_{Air}','LineStyle','--');
    end;
end;