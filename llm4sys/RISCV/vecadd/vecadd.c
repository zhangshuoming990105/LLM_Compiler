#include <stdio.h>

void vecadd(float *a, float *b, float *c, int n) {
    for(int i = 0; i < n; i++) {
        c[i] = a[i] + b[i];
    }
}

int main() {
    float a[4] = {1.0, 2.0, 3.0, 4.0};
    float b[4] = {1.0, 2.0, 3.0, 4.0};
    float c[4];
    vecadd(a, b, c, 4);
    for(int i = 0; i < 4; i++) {
        printf("%f\n", c[i]);
    }
    return 0;
}