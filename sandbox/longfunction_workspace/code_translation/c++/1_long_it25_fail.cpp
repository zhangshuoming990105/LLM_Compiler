#include <iostream>

int arr1[10][10];

struct MyStruct1 {
    float f1;
    int i1;
};

struct MyStruct2 {
    MyStruct1* s1;
    int i2;
    double d1;
    double d2;
    MyStruct1* s2;
};

void longFunction1(MyStruct2* res) {
    int i, j, k;

    // Initialize 1
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 10; j++) {
            arr1[i][j] = 0;
        }
    }

    // op1
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 10; j++) {
            for (k = 0; k < res->i2; k++) {
                arr1[i][j] += res->s1->i1;
            }
        }
    }

    // op2
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 10; j++) {
            arr1[i][j] += res->s2->i1;
        }
    }

    // op3
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 10; j++) {
            arr1[i][j] += static_cast<int>(res->d1 / res->d2);
        }
    }
}

int main() {
    MyStruct1 s1 = {1.0f, 2};
    MyStruct1 s2 = {3.0f, 4};
    MyStruct2 result_struct = {&s1, 3, 18.0, 5.0, &s2};

    longFunction1(&result_struct);

    std::cout << "arr1[0][0] = " << arr1[0][0] << std::endl;
    std::cout << "arr1[9][9] = " << arr1[9][9] << std::endl;

    return 0;
}