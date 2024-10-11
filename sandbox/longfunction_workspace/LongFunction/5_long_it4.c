#include <stdio.h>

int main() {
    double x, y, z;
    int i, j;
    x = 1.0;
    y = 2.0;
    z = 3.0;
    if(z == x + y) {
        for(i = 0; i < 5; i++) {
            z += x;
            x += y;
            y += z;
        }
    }
    else {
        for(j = 0; j < 5; j++) {
            z -= x;
            x -= y;
            y -= z;
        }
    }
    y -= 154.0;
    x -= 117.0;
    z -= 86.0;
    if(z == x + y) {
        for(i = 0; i < 5; i++) {
            z += x;
            x += y;
            y += z;
        }
    }
    else {
        for(j = 0; j < 5; j++) {
            z -= x;
            x -= y;
            y -= z;
        }
    }
    y -= 154.0;
    x -= 117.0;
    z -= 86.0;
    if(z == x + y) {
        for(i = 0; i < 5; i++) {
            z += x;
            x += y;
            y += z;
        }
    }
    else {
        for(j = 0; j < 5; j++) {
            z -= x;
            x -= y;
            y -= z;
        }
    }
    y -= 154.0;
    x -= 117.0;
    z -= 86.0;
    if(z == x + y) {
        for(i = 0; i < 5; i++) {
            z += x;
            x += y;
            y += z;
        }
    }
    else {
        for(j = 0; j < 5; j++) {
            z -= x;
            x -= y;
            y -= z;
        }
    }
    y -= 154.0;
    x -= 117.0;
    z -= 86.0;


    // print
    printf("x = %.2lf\n", x);
    printf("y = %.2lf\n", y);
    printf("z = %.2lf\n", z);


    return 0;
}