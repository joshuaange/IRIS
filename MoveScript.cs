using UnityEngine;
public class MoveScript : MonoBehaviour
{
    void Start()
    {
        transform.position = new Vector3(0.000000f, 0.000000f, 0.000000f);
    }

    void Update()
    {
        transform.position = transform.position + new Vector3(13.900000f, 0.000000f, 0.000000f);
    }
}