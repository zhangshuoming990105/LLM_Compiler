#include <stdio.h>
#include <stdlib.h>

void vector_add(float *dst, float *src1, float *src2, int n) {
    for (int i = 0; i < n; i += 4) {

/*
    +r: Read/write operand.
    r: Read-only operand.
    =r: Write-only operand.
    r means general-purpose register, m means memory.
*/
        __asm__ volatile(
            "vsetvli t0, %4, e32, m1, ta, ma\n\t"  // Set vector length
            "vle32.v v0, (%1)\n\t"                 // Load vector from src1
            "vle32.v v1, (%2)\n\t"                 // Load vector from src2
            "vfadd.vv v2, v0, v1\n\t"              // Add vectors
            "vse32.v v2, (%0)\n\t"                 // Store result to dst
            : "+r" (dst), "+r" (src1), "+r" (src2)
            : "r" (n - i)
            : "v0", "v1", "v2", "t0"
        );
        dst += 4;
        src1 += 4;
        src2 += 4;
    }
}

int main() {
    int n = 16;
    float *src1 = (float*)malloc(n * sizeof(float));
    float *src2 = (float*)malloc(n * sizeof(float));
    float *dst = (float*)malloc(n * sizeof(float));

    // Initialize src1 and src2
    for (int i = 0; i < n; i++) {
        src1[i] = i;
        src2[i] = i * 2;
    }

    // Perform vector addition
    vector_add(dst, src1, src2, n);

    // Print results
    for (int i = 0; i < n; i++) {
        printf("%.2f ", dst[i]);
    }
    printf("\n");

    free(src1);
    free(src2);
    free(dst);

    return 0;
}