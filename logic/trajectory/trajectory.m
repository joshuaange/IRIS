fid = fopen(strcat(folder,'\logic\trajectory\construct.m'),'w');
fprintf(fid, '%% This script is automatically constructed by trajectory.m \n');

% This function creates the position functions across axes while bearing in
% mind the dynamic nature of gravity and atmospheric density (http://farside.ph.utexas.edu/teaching/336k/Newtonhtml/node29.html)

% For x and y positions, gravity and atmospheric density are considered to
% be constant - which works for large conditions, where the interval time
% isn't hit by the time the horizontal velocity essentially becomes zero,
% and works for small conditions, where it is assumed to be constant
% anyways

%fplot(L_min,[0,100000],'Color','blue');
%hold on;
%fplot(L_max,[0,100000],'Color','blue','LineStyle',':');

fprintf(fid, '\n');
fprintf(fid, '%% No parachute... \n');

t_A_end = 0;
t_A_last = -0.0000000000001; t_A_vel = u_i(2,3); t_A_pos = u_i(1,3)+L_min; %Start pos, vel, and time

% x_i and y_i continuous functions
fprintf(fid,strcat('x_i(t) = (',string(u_i(2,1)),'*Q(',string((t_A_pos+L_min)/2),'))/g(',string((t_A_pos+L_min)/2),') * (1-exp((-g(',string((t_A_pos+L_min)/2),')*t)/Q(',string((t_A_pos+L_min)/2),'))) + ',string(u_i(1,1)),';\n'));
fprintf(fid,strcat('y_i(t) = (',string(u_i(2,2)),'*Q(',string((t_A_pos+L_min)/2),'))/g(',string((t_A_pos+L_min)/2),') * (1-exp((-g(',string((t_A_pos+L_min)/2),')*t)/Q(',string((t_A_pos+L_min)/2),'))) + ',string(u_i(1,2)),';\n'));
% Looping through and constructing piecewise equation from intervals (z_i because there is a natural stopping point at L_min)
fprintf(fid, 'z_i(t) = piecewise(');
while t_A_end == 0
    % Creating equation for position based on interval
    z_i(t) = (Q(t_A_pos)/g(t_A_pos)) * ((t_A_vel)+Q(t_A_pos)) * (1-exp((-g(t_A_pos)*(t))/Q(t_A_pos))) - (Q(t_A_pos)*(t)) + t_A_pos;
    %fplot(z_i,[0,100000],'Color','yellow');
    %plot(t_A_last,t_A_pos,'d');
    
    % Printing to construct.m
    fprintf(fid,strcat('(',string((t_A_last)),'<=t<',string((t_A_last)+t_A_int),'), (',string(double(Q(t_A_pos))),'/',string(double(g(t_A_pos))),') * ((',string((t_A_vel)),')+',string(double(Q(t_A_pos))),') * (1-exp((-',string(double(g(t_A_pos))),'*(t-',string(double(t_A_last)),'))/',string(double(Q(t_A_pos))),')) - (',string(double(Q(t_A_pos))),'*(t-',string(double(t_A_last)),')) + ',string((t_A_pos)))); 

    % Finding start conditions for subsequent loop
    t_A_pos = vpa(z_i(t_A_int));
    t_A_diff = diff(z_i); 
    t_A_vel = vpa(t_A_diff(t_A_int));

    % End condition
    if t_A_pos <= L_min
        t_A_end = 1;
        fprintf(fid, ');\n');
        % derivatives
        fprintf(fid, '\n');
        fprintf(fid,'dx_idt = diff(x_i);\n');
        fprintf(fid,'dy_idt = diff(y_i);\n');
        fprintf(fid,'dz_idt = diff(z_i);\n');
    else
        % moving to next interval for subsequent loop
        t_A_last = t_A_last + t_A_int;
        fprintf(fid, ', ');
    end
end

fclose(fid);
run(strcat(folder,'\logic\trajectory\construct.m')); 
fid = fopen(strcat(folder,'\logic\trajectory\construct.m'),'a+');

if parachute == 1
    fprintf(fid, '\n');
    fprintf(fid, '%% Parachute... \n');

    % Finding Parachute z_i
    t_A_end = 0;
    t_A_vel = dz_idt(t_o); t_A_pos = z_i(t_o); %Start pos, vel, and time
    % If lies at discontinuous point!
    if isnan(t_A_vel) == 1
        t_A_vel = (dz_idt(t_o+0.001)+dz_idt(t_o-0.001))/2;
    end
    t_A_last = t_o; 
    fprintf(fid, 'z_iParachute(t) = piecewise(');
    while t_A_end == 0
        % Creating equation for position based on interval
        z_iParachute(t) = (Q_o(t_A_pos)/g(t_A_pos)) * ((t_A_vel)+Q_o(t_A_pos)) * (1-exp((-g(t_A_pos)*(t))/Q_o(t_A_pos))) - (Q_o(t_A_pos)*(t)) + t_A_pos;
        %fplot(z_iParachute,[0,100000],'Color','green');
        %plot(t_A_last,t_A_pos,'s');

        % Printing to construct.m
        fprintf(fid,strcat('(',string((t_A_last)),'<=t<',string((t_A_last)+t_A_int),'), (',string(double(Q_o(t_A_pos))),'/',string(double(g(t_A_pos))),') * ((',string((t_A_vel)),')+',string(double(Q_o(t_A_pos))),') * (1-exp((-',string(double(g(t_A_pos))),'*(t-',string(double(t_A_last)),'))/',string(double(Q_o(t_A_pos))),')) - (',string(double(Q_o(t_A_pos))),'*(t-',string(double(t_A_last)),')) + ',string((t_A_pos)))); 

        % Finding start conditions for subsequent loop
        t_A_pos = double(z_iParachute(t_A_int));
        t_A_diff = diff(z_iParachute); 
        t_A_vel = double(t_A_diff(t_A_int));

        % End condition
        if t_A_pos <= L_min
            t_A_end = 1;
            fprintf(fid, ');\n');
        else
            % moving to next interval for subsequent loop
            t_A_last = t_A_last + t_A_int;
            fprintf(fid, ', ');
        end
    end

    % Real piecewise functions
    fprintf(fid,'z_i(t) = piecewise((t<=t_o), z_i(t),(t>t_o), z_iParachute(t));\n\n');
    % X
    fprintf(fid,'t_A_velX = dx_idt(t_o); t_A_posX = x_i(t_o); %%Start pos, vel, and time\n');
    fprintf(fid,'%% If lies at discontinuous point!\n');
    fprintf(fid,'if isnan(t_A_velX) == 1\n');
    fprintf(fid,'    t_A_velX = (dx_idt(t_o+0.001)+dx_idt(t_o-0.001))/2;\n');
    fprintf(fid,'end\n');
    fprintf(fid,'x_iParachute(t) = (t_A_velX*Q_o(z_i(t_o)))/g(z_i(t_o)) * (1-exp((-g(z_i(t_o))*t)/Q_o(z_i(t_o)))) + t_A_posX;\n');
    fprintf(fid,strcat('x_i(t) = piecewise((t<=t_o), x_i(t), (t>t_o), x_iParachute(t));\n'));
    % Y
    fprintf(fid,'t_A_velY = dy_idt(t_o); t_A_posY = y_i(t_o); %%Start pos, vel, and time\n');
    fprintf(fid,'%% If lies at discontinuous point!\n');
    fprintf(fid,'if isnan(t_A_velY) == 1\n');
    fprintf(fid,'    t_A_velY = (dy_idt(t_o+0.001)+dy_idt(t_o-0.001))/2;\n');
    fprintf(fid,'end\n');
    fprintf(fid,'y_iParachute(t) = (t_A_velY*Q_o(z_i(t_o)))/g(z_i(t_o)) * (1-exp((-g(z_i(t_o))*t)/Q_o(z_i(t_o)))) + t_A_posY;\n');
    fprintf(fid,strcat('y_i(t) = piecewise((t<=t_o), y_i(t), (t>t_o), y_iParachute(t));\n'));                                  
                                                                                  
    % derivatives
    fprintf(fid, '\n');
    fprintf(fid,'dx_idt = diff(x_i);\n');
    fprintf(fid,'dy_idt = diff(y_i);\n');
    fprintf(fid,'dz_idt = diff(z_i);\n');
end

fclose(fid);
run(strcat(folder,'\logic\trajectory\construct.m')); 

%fplot(z_i,[0,100000],'Color','red');