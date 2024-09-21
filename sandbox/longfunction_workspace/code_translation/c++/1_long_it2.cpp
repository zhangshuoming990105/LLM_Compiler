#include <iostream>
#include <vector>

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

std::vector<std::vector<int>> arr1(10, std::vector<int>(10));

void longfunction1(MyStruct2* res) {
    // initialize 1
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            arr1[i][j] = 0;
        }
    }

    // op1
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            for (int k = 0; k < res->i2; ++k) {
                arr1[i][j] += res->s1->i1;
            }
        }
    }

    // op2
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            arr1[i][j] += res->s2->i1;
        }
    }

    // op3
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            arr1[i][j] += static_cast<int>(res->d1 / res->d2);
        }
    }

    // op1 again
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            for (int k = 0; k < res->i2; ++k) {
                arr1[i][j] += res->s1->i1;
            }
        }
    }

    // op2 again
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            arr1[i][j] += res->s2->i1;
        }
    }

    // op3 again
    for (int i = 0; i < 10; ++i) {
        for (int j = 0; j < 10; ++j) {
            arr1[i][j] += static_cast<int>(res->d1 / res->d2);
        }
    }
}

int main() {
    // unittest on longfunction1
    MyStruct1 s1 = {1.0f, 2};
    MyStruct1 s2 = {3.0f, 4};
    MyStruct2 result_struct = {&s1, 3, 18.0, 5.0, &s2};
    
    longfunction1(&result_struct);
    
    std::cout << "arr1[0][0] = " << arr1[0][0] << std::endl;
    std::cout << "arr1[9][9] = " << arr1[9][9] << std::endl;

    return 0;
}