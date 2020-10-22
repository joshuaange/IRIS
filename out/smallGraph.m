for iit = 1:iitMax
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            quiver3(s{iit,jit}.vec_O(1,1),s{iit,jit}.vec_O(1,2),s{iit,jit}.vec_O(1,3),s{iit,jit}.vec_O(2,1),s{iit,jit}.vec_O(2,2),s{iit,jit}.vec_O(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.5,'DisplayName','Traced Segment Vector');
            plot3(s{iit,jit}.vec_O(1,1)+s{iit,jit}.vec_O(2,1),s{iit,jit}.vec_O(1,2)+s{iit,jit}.vec_O(2,2),s{iit,jit}.vec_O(1,3)+s{iit,jit}.vec_O(2,3),'Marker','o','DisplayName','Starting Point','Color','cyan');
            quiver3(s{iit,jit}.vec_VR(1,1),s{iit,jit}.vec_VR(1,2),s{iit,jit}.vec_VR(1,3),s{iit,jit}.vec_VR(2,1),s{iit,jit}.vec_VR(2,2),s{iit,jit}.vec_VR(2,3),'lineWidth',1,'Color','magenta','MaxHeadSize',0.5,'DisplayName','vec_VR');
            quiver3(s{iit,jit}.vec_VE(1,1),s{iit,jit}.vec_VE(1,2),s{iit,jit}.vec_VE(1,3),s{iit,jit}.vec_VE(2,1),s{iit,jit}.vec_VE(2,2),s{iit,jit}.vec_VE(2,3),'lineWidth',1,'Color','cyan','MaxHeadSize',0.5,'DisplayName','vec_VE');
            quiver3(s{iit,jit}.velocityEnd(1,1),s{iit,jit}.velocityEnd(1,2),s{iit,jit}.velocityEnd(1,3),s{iit,jit}.velocityEnd(2,1),s{iit,jit}.velocityEnd(2,2),s{iit,jit}.velocityEnd(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','New Velocity');
            quiver3(s{iit,jit}.vec_VF(1,1),s{iit,jit}.vec_VF(1,2),s{iit,jit}.vec_VF(1,3),s{iit,jit}.vec_VF(2,1),s{iit,jit}.vec_VF(2,2),s{iit,jit}.vec_VF(2,3),'lineWidth',1,'Color','yellow','MaxHeadSize',0.5,'DisplayName','vec_VF');
            quiver3(s{iit,jit}.quatV_pInfluence(1,1),s{iit,jit}.quatV_pInfluence(1,2),s{iit,jit}.quatV_pInfluence(1,3),s{iit,jit}.quatV_pInfluence(2,1),s{iit,jit}.quatV_pInfluence(2,2),s{iit,jit}.quatV_pInfluence(2,3),'lineWidth',0.5,'Color','white','MaxHeadSize',0.5,'DisplayName','quatV_pInfluence','LineStyle',':');
            quiver3(s{iit,jit}.quatV_ground(1,1),s{iit,jit}.quatV_ground(1,2),s{iit,jit}.quatV_ground(1,3),s{iit,jit}.quatV_ground(2,1),s{iit,jit}.quatV_ground(2,2),s{iit,jit}.quatV_ground(2,3),'lineWidth',0.5,'Color','white','MaxHeadSize',0.1,'DisplayName','quatV_ground','LineStyle','--');
            quiver3(s{iit,jit}.quatV_next(1,1),s{iit,jit}.quatV_next(1,2),s{iit,jit}.quatV_next(1,3),s{iit,jit}.quatV_next(2,1),s{iit,jit}.quatV_next(2,2),s{iit,jit}.quatV_next(2,3),'lineWidth',1,'Color','white','MaxHeadSize',0.5,'DisplayName','quatV_next','LineStyle','-');
            plot3(S_2(1),S_2(2),S_2(3),'Marker','o','DisplayName','Ending Point','Color','red');
        end;
    end;
end;