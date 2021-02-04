time = 0;
timeArray = [time];
xArray = [double(b{1}.u_i(1,1))];
yArray = [double(b{1}.u_i(1,2))];
zArray = [double(b{1}.u_i(1,3))];

for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/t_step)
            multitude = iteration * t_step;
            time = time + t_step;
            timeArray(length(timeArray)+1,1) = time;
            xArray(length(xArray)+1,1) = vpa(b{iit}.x_i(multitude));
            yArray(length(yArray)+1,1) = vpa(b{iit}.y_i(multitude));
            zArray(length(zArray)+1,1) = vpa(b{iit}.z_i(multitude));
        end
    end
    for jit = 1:j_max
        if isempty(s{iit,jit}) == 0
            time = time + T;
            timeArray(length(timeArray)+1,1) = time;
            xArray(length(xArray)+1,1) = vpa(s{iit,jit}.Cn_ij(1));
            yArray(length(yArray)+1,1) = vpa(s{iit,jit}.Cn_ij(2));
            zArray(length(zArray)+1,1) = vpa(s{iit,jit}.Cn_ij(3));
        end
    end
end

MAIN = table(timeArray,xArray,yArray,zArray);
writetable(MAIN);