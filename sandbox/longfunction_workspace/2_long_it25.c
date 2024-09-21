#include <stdio.h>

double arr1[10][10];
double arr2[10][10];
double arr3[10][10];
double result[10][10];

int main() {
  int i, j, k;
  int trigger[10] = {3, 8, 14, 20, 25, 30, 35, 40, 43, 57};
  double init_val[10] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0};
  // init
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      arr1[i][j] = 0;
      arr2[i][j] = 0;
      arr3[i][j] = 0;
      result[i][j] = 0;
    }
  }
  // set values
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        if (i * 10 + j == trigger[k]) {
          arr1[i][j] = init_val[k];
          arr2[i][j] = init_val[k];
          arr3[i][j] = init_val[k];
        }
      }
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] -= arr1[i][j] * arr2[i][j] * arr3[i][j]; // needle
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // matmul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      for (k = 0; k < 10; k++) {
        arr3[i][j] += arr1[i][k] * arr2[k][j];
      }
    }
  }
  // add
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] + arr2[i][j] + arr3[i][j];
    }
  }
  // mul
  for (i = 0; i < 10; i++) {
    for (j = 0; j < 10; j++) {
      result[i][j] += arr1[i][j] * arr2[i][j] * arr3[i][j];
    }
  }
  // print
  for (i = 0; i < 10; i++) {
    printf("[");
    for (j = 0; j < 10; j++) {
      printf("%.3f", result[i][j]);
      if (j != 9) {
        printf(", ");
      }
    }
    printf("]\n");
  }
  return 0;
}
