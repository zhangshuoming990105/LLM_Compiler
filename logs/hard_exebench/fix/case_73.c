#include <stdio.h>

#include <stdlib.h>

#include <stdbool.h>

#include <string.h>

#include <errno.h>

long gcd(long a, long b)
{
    int i, d;

    d = 1;
    for (i = 1; i <= a && i <= b; ++i) {
        if ((a % i == 0) && (b % i == 0)) {
            d = i;
        }
    }

    return d;
}