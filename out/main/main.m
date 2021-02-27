try
    figure(figure_main);
catch
    figure_main = figure('Name','Pod Motion');
end

surfc(L_x, L_y, L_z,'EdgeAlpha',0.1,'DisplayName','Surface Topology') % Mesh Plot
colormap(gray) 
hold on;

fplot3(x_i,y_i,z_i,[0 148])

%  for iit = 1:i_max
%      if isempty(b{iit}) == 0
%          run(strcat(folder,'\out\main\trajectory.m'));
%      end
%      for jit = 1:j_max
%          if isempty(s{iit,jit}) == 0
%              run(strcat(folder,'\out\main\segment.m'));
%          end
%      end
% end

grid minor;
%axis equal;
xlim([0 L_domain]);
ylim([0 L_domain]);
zlim([0 L_range]);
view(3);
%legend;
hold off;