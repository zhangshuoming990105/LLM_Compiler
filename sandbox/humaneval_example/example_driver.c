#include <stdbool.h>
#include <assert.h>

bool has_close_elements(float numbers[], int size, float threshold);

void check(bool (*candidate)(float[], int, float)) {
    float arr1[] = {1.0, 2.0, 3.9, 4.0, 5.0, 2.2};
    float arr2[] = {1.0, 2.0, 3.9, 4.0, 5.0, 2.2};
    float arr3[] = {1.0, 2.0, 5.9, 4.0, 5.0};
    float arr4[] = {1.0, 2.0, 5.9, 4.0, 5.0};
    float arr5[] = {1.0, 2.0, 3.0, 4.0, 5.0, 2.0};
    float arr6[] = {1.1, 2.2, 3.1, 4.1, 5.1};
    float arr7[] = {1.1, 2.2, 3.1, 4.1, 5.1};

    assert(candidate(arr1, 6, 0.3) == true);
    assert(candidate(arr2, 6, 0.05) == false);
    assert(candidate(arr3, 5, 0.95) == true);
    assert(candidate(arr4, 5, 0.8) == false);
    assert(candidate(arr5, 6, 0.1) == true);
    assert(candidate(arr6, 5, 1.0) == true);
    assert(candidate(arr7, 5, 0.5) == false);
}

int main() {
    check(has_close_elements);
    return 0;
}