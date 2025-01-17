#include <cuda_runtime.h>
#include <stdio.h>
int main() {
    int count;
    cudaGetDeviceCount(&count);
    printf("CUDA Device Count: %d\n", count);
    return 0;
}
