using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VectorScript : MonoBehaviour
{
    public GameObject g;
    Vector3[] points;
    int index;
    int i;
    void Start() {
        g = GameObject.CreatePrimitive(PrimitiveType.Sphere);
        g.transform.localScale = new Vector3(2.000000f, 2.000000f, 2.000000f);
        points = new Vector3[35];
        points[0] = new Vector3(0.000000f, 0.000000f, 0.000000f);
        points[1] = new Vector3(0.095297f, 0.429004f, 0.000000f);
        points[2] = new Vector3(0.181773f, 0.724850f, 0.000000f);
        points[3] = new Vector3(0.260244f, 0.899864f, 0.000000f);
        points[4] = new Vector3(0.331452f, 0.965230f, 0.000000f);
        points[5] = new Vector3(0.396069f, 0.931097f, 0.000000f);
        points[6] = new Vector3(0.454705f, 0.806675f, 0.000000f);
        points[7] = new Vector3(0.507913f, 0.600322f, 0.000000f);
        points[8] = new Vector3(0.556196f, 0.319621f, 0.000000f);
        points[9] = new Vector3(0.600009f, -0.028545f, 0.000000f);
        points[10] = new Vector3(0.639768f, -0.437932f, 0.000000f);
        points[11] = new Vector3(0.675846f, -0.902873f, 0.000000f);
        points[12] = new Vector3(0.708584f, -1.418226f, 0.000000f);
        points[13] = new Vector3(1.740610f, -1.035317f, -0.403041f);
        points[14] = new Vector3(2.817873f, -1.052268f, -0.621389f);
        points[15] = new Vector3(3.944177f, -1.083442f, -0.933124f);
        points[16] = new Vector3(5.214340f, -1.123299f, -1.331699f);
        points[17] = new Vector3(6.854061f, -1.181131f, -1.910023f);
        points[18] = new Vector3(0.095297f, 0.429004f, 0.000000f);
        points[19] = new Vector3(0.181773f, 0.724850f, 0.000000f);
        points[20] = new Vector3(0.260244f, 0.899864f, 0.000000f);
        points[21] = new Vector3(0.331452f, 0.965230f, 0.000000f);
        points[22] = new Vector3(0.396069f, 0.931097f, 0.000000f);
        points[23] = new Vector3(0.454705f, 0.806675f, 0.000000f);
        points[24] = new Vector3(0.507913f, 0.600322f, 0.000000f);
        points[25] = new Vector3(0.556196f, 0.319621f, 0.000000f);
        points[26] = new Vector3(0.600009f, -0.028545f, 0.000000f);
        points[27] = new Vector3(0.639768f, -0.437932f, 0.000000f);
        points[28] = new Vector3(0.675846f, -0.902873f, 0.000000f);
        points[29] = new Vector3(0.708584f, -1.418226f, 0.000000f);
        points[30] = new Vector3(1.740610f, -1.035317f, -0.403041f);
        points[31] = new Vector3(2.817873f, -1.052268f, -0.621389f);
        points[32] = new Vector3(3.944177f, -1.083442f, -0.933124f);
        points[33] = new Vector3(5.214340f, -1.123299f, -1.331699f);
        points[34] = new Vector3(6.854061f, -1.181131f, -1.910023f);
    }
    void Update() {
        g.transform.position = Vector3.MoveTowards(g.transform.position,points[index], Time.deltaTime*10);
        if(g.transform.position==points[index]) { index++; if ( index > points.Length - 1) { index = 34; } }
    }
}