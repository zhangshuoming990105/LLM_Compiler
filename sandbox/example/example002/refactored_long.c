#include <stdio.h>
#include <stdlib.h>
#define RAND_MAX_CUSTOM 2147483647

void initializeArray(float *array, int size, float min, float max) {
  for (int i = 0; i < size; i++) {
    array[i] = (float)rand() / RAND_MAX_CUSTOM * (max - min) + min;
  }
}

void printArray(float *array, int size, char *arrayName) {
  printf("%s:\n[", arrayName);
  for (int i = 0; i < size; i++) {
    printf("%f", array[i]);
    if (i < size - 1) {
      printf(", ");
    }
  }
  printf("]\n");
}

void mlp(float *in, float *w1, float *w2, float *out, int batch_size,
         int in_size, int hidden_size, int out_size);

int main() {
  int batch_size = 1;
  int in_size = 4;
  int out_size = 10;
  int hidden_size = 8;
  float in[batch_size * in_size];
  float w1[in_size * hidden_size];
  float w2[hidden_size * out_size];
  float out[batch_size * out_size];

  initializeArray(in, batch_size * in_size, -1, 1);
  printArray(in, batch_size * in_size, "in");
  initializeArray(w1, in_size * hidden_size, -3, 3);
  printArray(w1, in_size * hidden_size, "w1");
  initializeArray(w2, hidden_size * out_size, -3, 3);
  printArray(w2, hidden_size * out_size, "w2");

  mlp(in, w1, w2, out, batch_size, in_size, hidden_size, out_size);
  printArray(out, batch_size * out_size, "out");

  return 0;
}