#include <stdio.h>

int mySqrt(int x) {
    int i, sum;
    for (i = 1, sum = 0; sum < sum + i * 2 - 1 && (sum += i * 2 - 1) < x; i++);
    return sum == x ? i : i-1;
}