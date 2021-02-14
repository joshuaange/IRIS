public GameObject g;
Vector3[] points;
int index;
int i;
double deltaTime = 0.100000;
void Start () {
	g = GameObject.CreatePrimitive (PrimitiveType.Cube);
	points = new Vector3[34];
	points [0] = new Vector3 (0.000000, 0.000000, 0.000000);
	points [1] = new Vector3 (0.095297, 0.000000, 0.429004);
	points [2] = new Vector3 (0.181773, 0.000000, 0.724850);
	points [3] = new Vector3 (0.260244, 0.000000, 0.899864);
	points [4] = new Vector3 (0.331452, 0.000000, 0.965230);
	points [5] = new Vector3 (0.396069, 0.000000, 0.931097);
	points [6] = new Vector3 (0.454705, 0.000000, 0.806675);
	points [7] = new Vector3 (0.507913, 0.000000, 0.600322);
	points [8] = new Vector3 (0.556196, 0.000000, 0.319621);
	points [9] = new Vector3 (0.600009, 0.000000, -0.028545);
	points [10] = new Vector3 (0.639768, 0.000000, -0.437932);
	points [11] = new Vector3 (0.675846, 0.000000, -0.902873);
	points [12] = new Vector3 (0.708584, 0.000000, -1.418226);
	points [13] = new Vector3 (1.740610, -0.403041, -1.035317);
	points [14] = new Vector3 (2.817873, -0.621389, -1.052268);
	points [15] = new Vector3 (3.944177, -0.933124, -1.083442);
	points [16] = new Vector3 (5.214340, -1.331699, -1.123299);
	points [17] = new Vector3 (6.854061, -1.910023, -1.181131);
	points [18] = new Vector3 (0.095297, 0.000000, 0.429004);
	points [19] = new Vector3 (0.181773, 0.000000, 0.724850);
	points [20] = new Vector3 (0.260244, 0.000000, 0.899864);
	points [21] = new Vector3 (0.331452, 0.000000, 0.965230);
	points [22] = new Vector3 (0.396069, 0.000000, 0.931097);
	points [23] = new Vector3 (0.454705, 0.000000, 0.806675);
	points [24] = new Vector3 (0.507913, 0.000000, 0.600322);
	points [25] = new Vector3 (0.556196, 0.000000, 0.319621);
	points [26] = new Vector3 (0.600009, 0.000000, -0.028545);
	points [27] = new Vector3 (0.639768, 0.000000, -0.437932);
	points [28] = new Vector3 (0.675846, 0.000000, -0.902873);
	points [29] = new Vector3 (0.708584, 0.000000, -1.418226);
	points [30] = new Vector3 (1.740610, -0.403041, -1.035317);
	points [31] = new Vector3 (2.817873, -0.621389, -1.052268);
	points [32] = new Vector3 (3.944177, -0.933124, -1.083442);
	points [33] = new Vector3 (5.214340, -1.331699, -1.123299);
	points [34] = new Vector3 (6.854061, -1.910023, -1.181131);
}
void Update () {
	g.transform.position = Vector3.MoveTowards (g.transform.position,points[index], Time.deltaTime*2);
	if(g.transform.position==points[index]) {
		index++;if(index>points.Length-1){index=0;}
	}
}