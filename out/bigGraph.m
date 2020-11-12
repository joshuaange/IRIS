for iit = 1:iitMax
    if isempty(b{iit}) == 0
        % Trajectory
        fplot3(b{iit}.xt,b{iit}.yt,b{iit}.zt,[trajectoryMin trajectoryMax],'DisplayName','Trajectory','lineWidth',1,'Color','black');
        quiver3(b{iit}.velocityStart(1,1),b{iit}.velocityStart(1,2),b{iit}.velocityStart(1,3),b{iit}.velocityStart(2,1),b{iit}.velocityStart(2,2),b{iit}.velocityStart(2,3),'lineWidth',1,'Color','green','MaxHeadSize',0.5,'DisplayName','Launch Velocity');
        plot3(b{iit}.velocityHit(1,1),b{iit}.velocityHit(1,2),b{iit}.velocityHit(1,3),'Marker','s','DisplayName','Final Impact Point');
        quiver3(b{iit}.velocityHit(1,1),b{iit}.velocityHit(1,2),b{iit}.velocityHit(1,3),b{iit}.velocityHit(2,1),b{iit}.velocityHit(2,2),b{iit}.velocityHit(2,3),'lineWidth',1,'Color','red','MaxHeadSize',0.5,'DisplayName','Impact Velocity');
        plot3(b{iit}.velocityStart(1,1),b{iit}.velocityStart(1,2),b{iit}.velocityStart(1,3),'Marker','x','DisplayName','Start Point','Color','green');
        quiver3(b{iit}.quatV_air(1,1),b{iit}.quatV_air(1,2),b{iit}.quatV_air(1,3),b{iit}.quatV_air(2,1),b{iit}.quatV_air(2,2),b{iit}.quatV_air(2,3),'lineWidth',0.5,'Color','black','MaxHeadSize',0.1,'DisplayName','Quaternion_{Air}','LineStyle','--');
        % Pod Shape
        surf(X, Y, Z,'DisplayName','Pod','facealpha',0.75,'edgealpha',0.5);
        plot3(b{iit}.C(1),b{iit}.C(2),b{iit}.C(3),'Marker','o','DisplayName','Center Impact Point','Color','red');
        for dimOne = 1:x_limit
            for dimTwo = 1:y_limit
                if abs(L(X(dimOne,dimTwo),Y(dimOne,dimTwo))-Z(dimOne,dimTwo))<minimumEqual
                    plot3(X(dimOne,dimTwo),Y(dimOne,dimTwo),Z(dimOne,dimTwo),'Marker','x','DisplayName','Impact Vertex','Color','red','HandleVisibility','off');
                end;
            end;
        end;
        plot3(b{iit}.S(1), b{iit}.S(2), b{iit}.S(3),'Marker','o','DisplayName','Average Impact Point','Color','cyan');
    end;
end;