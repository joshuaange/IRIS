% Constructing Arrays
time = 0;
timeArray = [time];
xArray = [double(b{1}.u_i(1,1))];
yArray = [double(b{1}.u_i(1,2))];
zArray = [double(b{1}.u_i(1,3))];
for iit = 1:i_max
    if isempty(b{iit}) == 0
        for iteration = 1:floor(double(b{iit}.t_f_i)/t_step)
            multitude = iteration * T;
            time = time + T;
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
% Writing to script
fid = fopen('MATLAB_Movement.cs','wt');
fprintf(fid, 'public GameObject g;\n');
fprintf(fid, 'Vector3[] points;\n');
fprintf(fid, 'int index;\n');
fprintf(fid, 'int i;\n');
fprintf(fid, 'double deltaTime = %f;\n', T);
fprintf(fid, 'void Start () {\n');
fprintf(fid, '\tg = GameObject.CreatePrimitive (PrimitiveType.Cube);\n');
fprintf(fid, '\tpoints = new Vector3[%i];\n', size(timeArray,1)-1);
for indexValue = 1:size(timeArray,1)
    fprintf(fid, '\tpoints [%i] = new Vector3 (%f, %f, %f);\n', indexValue-1, xArray(indexValue), yArray(indexValue), zArray(indexValue));
end
fprintf(fid, '}\n');
fprintf(fid, 'void Update () {\n');
fprintf(fid, '\tg.transform.position = Vector3.MoveTowards (g.transform.position,points[index], Time.deltaTime*2);\n');
fprintf(fid, '\tif(g.transform.position==points[index]) {\n');
fprintf(fid, '\t\tindex++;if(index>points.Length-1){index=0;}\n');
fprintf(fid, '\t}\n');
fprintf(fid, '}');
fclose(fid);