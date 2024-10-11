#include <stdio.h>

int main() {

    int i = 0;
    int j = 0;
    int k = 0;
    int l = 0;
    int m = 0;
    int n = 0;
    int o = 0;

    for (i = 0; i < 10; i++) {
        j += i;
        k += j;
        l += k;
        m += l;
        n += m;
        o += n;
    }
    for (j = 0; j < 10; j++) {
        k += j;
        l += k;
        m += l;
        n += m;
        o += n;
    }
    for (k = 0; k < 10; k++) {
        l += k;
        m += l;
        n += m;
        o += n;
    }
    for (l = 0; l < 10; l++) {
        m += l;
        n += m;
        o += n;
    }
    for (m = 0; m < 10; m++) {
        n += m;
        o += n;
    }
    for (n = 0; n < 10; n++) {
        o += n;
    }
    for (o = 0; o < 10; o++) {
        ;
    }

    for (i = 0; i < 10; i++) {
        j += i;
        k += j;
        l += k;
        m += l;
        n += m;
        o += n;
    }
    for (j = 0; j < 10; j++) {
        k += j;
        l += k;
        m += l;
        n += m;
        o += n;
    }
    for (k = 0; k < 10; k++) {
        l += k;
        m += l;
        n += m;
        o += n;
    }
    for (l = 0; l < 10; l++) {
        m += l;
        n += m;
        o += n;
    }
    for (m = 0; m < 10; m++) {
        n += m;
        o += n;
    }
    for (n = 0; n < 10; n++) {
        o += n;
    }
    for (o = 0; o < 10; o++) {
        ;
    }


    // print
    printf("i = %d\n", i);
    printf("j = %d\n", j);
    printf("k = %d\n", k);
    printf("l = %d\n", l);
    printf("m = %d\n", m);
    printf("n = %d\n", n);
    printf("o = %d\n", o);

    return 0;
}