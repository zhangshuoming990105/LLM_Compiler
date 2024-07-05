#include <stdio.h>

// Declaration of the quant function
int quant(int n, int m);

int main() {
    // Arrays of 10 elements each for inputs n and m
    int n[10] = {10, -20, 30, -40, 50, 60, -70, 80, -90, 100};
    int m[10] = {3, 5, 7, 9, 11, 13, 15, 17, 19, 21};

    // Loop through the arrays and call the quant function
    for (int i = 0; i < 10; i++) {
        printf("%d: quant(%d, %d) = %d\n", i, n[i], m[i], quant(n[i], m[i]));
    }

    return 0;
}
