#include <stdio.h>
float UI_ClampCvar(float min, float max, float value);
int main() {
    float min[10] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0};
    float max[10] = {11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0};
    float value[10] = {-3.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 21.0};
    for (int i = 0; i < 10; i++) {
        printf("%f\n", UI_ClampCvar(min[i], max[i], value[i]));
    }
    return 0;
}