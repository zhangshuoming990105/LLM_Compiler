#include <stdio.h>
double light_time(double distance);
int main() {
    double distance = 0.0;
    light_time(distance);
    printf("light_time(0.0) = %f\n", light_time(distance));
    return 0;
}