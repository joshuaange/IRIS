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
        g.transform.localScale = new Vector3(0.075000f, 0.075000f, 0.075000f);
        points = new Vector3[4];
        points[0] = new Vector3(0.000000f, 0.000000f, 0.000000f);
        points[1] = new Vector3(1.373061f, 7.735318f, 0.000000f);
        points[2] = new Vector3(2.712792f, 15.185966f, 0.000000f);
        points[3] = new Vector3(53.179636f, 0.037505f, -0.000000f);
    }
    void Update() {
        g.transform.position = Vector3.MoveTowards(g.transform.position,points[index], Time.deltaTime*10);
        if(g.transform.position==points[index]) { index++; if ( index > points.Length - 1) { index = 3; } }
    }
}