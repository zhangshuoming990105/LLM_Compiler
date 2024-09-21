#include <stdio.h>
int arr1[10][10];
typedef struct {
  float f1;
  int i1;
} mystruct1;
typedef struct {
  mystruct1 *s1;
  int i2;
  double d1;
  double d2;
  mystruct1 *s2;
} mystruct2;

void longfunction1(mystruct2 *res) {
  int i, j, k;

  // initialize 1
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
      arr1[i][j] += (int)(res->d1 / res->d2);
    }
  }
  return;
}

int main() {
  // unittest on longfunction1
  mystruct1 s1 = {1.0, 2};
  mystruct1 s2 = {3.0, 4};
  mystruct2 result_struct = {&s1, 3, 18.0, 5.0, &s2};
  longfunction1(&result_struct);
  printf("arr1[0][0] = %d\n", arr1[0][0]);
  printf("arr1[9][9] = %d\n", arr1[9][9]);

  return 0;
}