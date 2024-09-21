#include <iostream> // Use iostream instead of stdio.h for C++
#include <array>    // Use array for fixed-size arrays
#include <iostream> // For std::cout

// Use std::array for type safety and bounds checking
std::array<std::array<int, 10>, 10> arr1;

// Define structs as classes in C++
class MyStruct1 {
public:
    float f1;
    int i1;
};

class MyStruct2 {
public:
    MyStruct1* s1;
    int i2;
    double d1;
    double d2;
    MyStruct1* s2;
};

// Function definition using C++ style
void longFunction1(MyStruct2* res) {
    int i, j, k;

    // initialize 1
    for (i = 0; i < 10; i++) {
        for (j = 0; j < 10; j++) {
            arr1[i][j] = 0;
        }
    }


// This is the 1st part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 2nd part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 3rd part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 4th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 5th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 6th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 7th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 8th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 9th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 10th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 11th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 12th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3 with modification
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>((res->d1 + 24.0) / res->d2); // needle
    }
}

// This is the 13th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 14th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 15th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 16th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 17th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 18th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 19th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 20th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 21th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 22th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 23th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 24th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 25th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 26th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 27th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 28th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 29th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 30th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 31th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 32th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 33th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 34th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 35th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 36th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 37th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 38th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 39th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 40th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 41th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 42th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 43th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 44th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 45th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 46th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 47th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 48th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 49th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 50th part of the code translation
// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// op1
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        for (int k = 0; k < res->i2; k++) {
            arr1[i][j] += res->s1->i1;
        }
    }
}

// op2
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += res->s2->i1;
    }
}

// op3
for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
        arr1[i][j] += static_cast<int>(res->d1 / res->d2);
    }
}

// This is the 51th part of the code translation
}



int main() {
    // unittest on longFunction1
    MyStruct1 s1 = {1.0f, 2};
    MyStruct1 s2 = {3.0f, 4};
    MyStruct2 result_struct = {&s1, 3, 18.0, 5.0, &s2};
    longFunction1(&result_struct);

    std::cout << "arr1[0][0] = " << arr1[0][0] << std::endl;
    std::cout << "arr1[9][9] = " << arr1[9][9] << std::endl;

    return 0;
}

// This is the 52th part of the code translation