__kernel void  vecadd (__global const int *A,
	                    __global const int *B,
	                    __global int *C)
{
  int gid = get_group_id(0);
  C[gid] = A[gid] + B[gid];
}