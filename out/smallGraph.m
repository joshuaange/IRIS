for iit = 1:iitMax
    for jit = 1:jitMax
        if isempty(s{iit,jit}) == 0
            quiver3(s{iit,jit}.vec_O(1,1),s{iit,jit}.vec_O(1,2),s{iit,jit}.vec_O(1,3),s{iit,jit}.vec_O(2,1),s{iit,jit}.vec_O(2,2),s{iit,jit}.vec_O(2,3),'lineWidth',1,'Color','blue','MaxHeadSize',0.5,'DisplayName','Traced Segment Vector');
        end;
    end;
end;