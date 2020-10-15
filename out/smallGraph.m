for iit = 1:iitMax
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            quiver3(s{iit,jit}.vec_O(1,1),s{iit,jit}.vec_O(1,2),s{iit,jit}.vec_O(1,3),s{iit,jit}.vec_O(2,1),s{iit,jit}.vec_O(2,2),s{iit,jit}.vec_O(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.5,'DisplayName','Traced Segment Vector');
            plot3(s{iit,jit}.vec_O(1,1)+s{iit,jit}.vec_O(2,1),s{iit,jit}.vec_O(1,2)+s{iit,jit}.vec_O(2,2),s{iit,jit}.vec_O(1,3)+s{iit,jit}.vec_O(2,3),'Marker','o','DisplayName','Starting Point','Color','cyan');
            quiver3(s{iit,jit}.vec_VR(1,1),s{iit,jit}.vec_VR(1,2),s{iit,jit}.vec_VR(1,3),s{iit,jit}.vec_VR(2,1),s{iit,jit}.vec_VR(2,2),s{iit,jit}.vec_VR(2,3),'lineWidth',1,'Color','magenta','MaxHeadSize',0.5,'DisplayName','vec_VR');
            quiver3(s{iit,jit}.vec_VE(1,1),s{iit,jit}.vec_VE(1,2),s{iit,jit}.vec_VE(1,3),s{iit,jit}.vec_VE(2,1),s{iit,jit}.vec_VE(2,2),s{iit,jit}.vec_VE(2,3),'lineWidth',0.5,'Color','magenta','MaxHeadSize',0.5,'DisplayName','vec_VR');
            quiver3(s{iit,jit}.velocityEnd(1,1),s{iit,jit}.velocityEnd(1,2),s{iit,jit}.velocityEnd(1,3),s{iit,jit}.velocityEnd(2,1),s{iit,jit}.velocityEnd(2,2),s{iit,jit}.velocityEnd(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','New Velocity');

        end;
    end;
end;