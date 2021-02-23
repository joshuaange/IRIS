%% POD
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
fid = fopen('VectorScript.cs','wt');
fprintf(fid, 'using System.Collections;\n');
fprintf(fid, 'using System.Collections.Generic;\n');
fprintf(fid, 'using UnityEngine;\n');
fprintf(fid, '\n');
fprintf(fid, 'public class VectorScript : MonoBehaviour\n');
fprintf(fid, '{\n');
fprintf(fid, '    public GameObject g;\n');
fprintf(fid, '    Vector3[] points;\n');
fprintf(fid, '    int index;\n');
fprintf(fid, '    int i;\n');
fprintf(fid, '    void Start() {\n');
fprintf(fid, '        g = GameObject.CreatePrimitive(PrimitiveType.Sphere);\n');
fprintf(fid, '        g.transform.localScale = new Vector3(%ff, %ff, %ff);\n', d, d, d);
fprintf(fid, '        points = new Vector3[%i];\n', size(timeArray,1));
for indexValue = 1:size(timeArray,1)
    fprintf(fid, '        points[%i] = new Vector3(%ff, %ff, %ff);\n', indexValue-1, xArray(indexValue), zArray(indexValue), yArray(indexValue));
end
fprintf(fid, '    }\n');
fprintf(fid, '    void Update() {\n');
fprintf(fid, '        g.transform.position = Vector3.MoveTowards(g.transform.position,points[index], Time.deltaTime*%i);\n', double(1/T));
fprintf(fid, '        if(g.transform.position==points[index]) { index++; if ( index > points.Length - 1) { index = %i; } }\n', size(timeArray,1)-1);
fprintf(fid, '    }\n');
fprintf(fid, '}');
fclose(fid);

%% PLANE

fid = fopen('MoveScript.cs','wt');
fprintf(fid, 'using UnityEngine;\n');
fprintf(fid, 'public class MoveScript : MonoBehaviour\n');
fprintf(fid, '{\n');
fprintf(fid, '    void Start()\n');
fprintf(fid, '    {\n');
fprintf(fid, '        transform.position = new Vector3(%ff, %ff, %ff);\n', double(b{1}.u_i(1,1)), double(b{1}.u_i(1,3)), double(b{1}.u_i(1,2)));
fprintf(fid, '    }\n');
fprintf(fid, '\n');
fprintf(fid, '    void Update()\n');
fprintf(fid, '    {\n');
fprintf(fid, '        transform.position = transform.position + new Vector3(%ff, %ff, %ff);\n', double(b{1}.u_i(2,1)), 0, double(b{1}.u_i(2,2)));
fprintf(fid, '    }\n');
fprintf(fid, '}');
fclose(fid);

%% MESH

fid = fopen('Grid.cs','wt');
fprintf(fid, 'using UnityEngine;\n');
fprintf(fid, 'using System.Collections;\n');
fprintf(fid, '\n');
fprintf(fid, '[RequireComponent(typeof(MeshFilter), typeof(MeshRenderer))]\n');
fprintf(fid, 'public class Grid : MonoBehaviour {\n');
fprintf(fid, '\n');
fprintf(fid, '    public int xSize, zSize;\n');
fprintf(fid, '    private void Awake() {\n');
fprintf(fid, '        xSize = %i;\n', (round(domainMax)-round(domainMin)));
fprintf(fid, '        zSize = %i;\n', (round(domainMax)-round(domainMin)));
fprintf(fid, '        StartCoroutine(Generate());\n');
fprintf(fid, '        transform.rotation = Quaternion.Euler(0, 90, 180);;\n');
fprintf(fid, '        transform.position = new Vector3(%i, 0, %i);;\n', round(domainMin), round(domainMin));
fprintf(fid, '    }\n');
fprintf(fid, '\n');
fprintf(fid, '    private Vector3[] vertices;\n');
fprintf(fid, '    private Mesh mesh;\n');
fprintf(fid, '\n');
fprintf(fid, '    private IEnumerator Generate() {\n');
fprintf(fid, '        WaitForSeconds wait = new WaitForSeconds(0.00f);\n');
fprintf(fid, '        GetComponent<MeshFilter>().mesh = mesh = new Mesh();\n');
fprintf(fid, '        mesh.name = "Procedural Grid";\n');
fprintf(fid, '        vertices = new Vector3[(xSize + 1) * (zSize + 1)];\n');
fprintf(fid, '        for (int i = 0, z = 0; z <= zSize; z++) {\n');
fprintf(fid, '            for (int x = 0; x <= xSize; x++, i++) {\n');
fprintf(fid, '                vertices[i] = new Vector3(x, 0, z);\n');
indexNumber = ((round(domainMax)-round(domainMin))+1)^2;
for XValue = domainMin:domainMax
    for YValue = domainMin:domainMax
        indexNumber = indexNumber - 1;
        fprintf(fid, '                if (i == %i) { vertices[i] = new Vector3(%ff, %ff, %ff); }\n', indexNumber, double(XValue), -double(L(XValue,YValue)), double(YValue));
    end
end
fprintf(fid, '                yield return wait;\n');
fprintf(fid, '            }\n');
fprintf(fid, '        }\n');
fprintf(fid, '        mesh.vertices = vertices;\n');
fprintf(fid, '        int[] triangles = new int[xSize * zSize * 6];\n');
fprintf(fid, '        for (int ti = 0, vi = 0, z = 0; z < zSize; z++, vi++) {\n');
fprintf(fid, '            for (int x = 0; x < xSize; x++, ti += 6, vi++) {\n');
fprintf(fid, '                triangles[ti] = vi;\n');
fprintf(fid, '                triangles[ti + 3] = triangles[ti + 2] = vi + 1;\n');
fprintf(fid, '                triangles[ti + 4] = triangles[ti + 1] = vi + xSize + 1;\n');
fprintf(fid, '                triangles[ti + 5] = vi + xSize + 2;\n');
fprintf(fid, '                mesh.triangles = triangles;\n');
fprintf(fid, '                yield return wait;\n');
fprintf(fid, '            }\n');
fprintf(fid, '        }\n');
fprintf(fid, '        mesh.RecalculateNormals();\n');
fprintf(fid, '    }\n');
fprintf(fid, '    private void OnDrawGizmos() {\n');
fprintf(fid, '        if (vertices == null) {\n');
fprintf(fid, '            return;\n');
fprintf(fid, '        }\n');
fprintf(fid, '        Gizmos.color = Color.black;\n');
fprintf(fid, '        for (int i = 0; i < vertices.Length; i++) {\n');
fprintf(fid, '            Gizmos.DrawSphere(vertices[i], 0.1f);\n');
fprintf(fid, '        }\n');
fprintf(fid, '    }\n');
fprintf(fid, '}');
fclose(fid);