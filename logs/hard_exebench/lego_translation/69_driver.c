#include <math.h>
#include <stdio.h>

int FP_Cmp(float a_fp, float b_fp);

int main() {
    float a_fp, b_fp;
    a_fp = 88.7196976598;
    b_fp = 70.4011644483;
    int x = FP_Cmp(a_fp, b_fp);
    printf("%d\n", x);
    return 0;
}