using UnityEngine;
public class MoveScript : MonoBehaviour
{
    void Start()
    {
        transform.position = new Vector3(-563200.000000f, 100000.000000f, 0.000000f);
    }

    void Update()
    {
        transform.position = transform.position + new Vector3(1603.172184f, 0.000000f, 0.000000f);
    }
}