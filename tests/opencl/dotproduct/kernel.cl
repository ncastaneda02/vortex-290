__kernel void DotProduct (__global float* a, __global float* b, __global float* c, int iNumElements)
{
    // find position in global arrays
    int  iGID = get_group_id(0);
    int seed  = iGID;

    for (int i = 0; i < 1000; i++) {
        int c = iGID ^ (iGID << 11);
        int r = 27 ^ (c >> 7);
        iGID += r;
    }
    c[seed] = iGID;
    //float cc = c[iGID];

    //printf("c[%d]=%f\n", iGID, cc);
}