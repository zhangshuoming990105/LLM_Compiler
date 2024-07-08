#include <stdio.h>
#include <stdlib.h>
#define RAND_MAX_CUSTOM 2147483647
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
  for (int i = 0; i < batch_size * in_size; i++) {
    in[i] = (float)rand() / RAND_MAX_CUSTOM * 2 - 1;
  }
  for (int i = 0; i < in_size * hidden_size; i++) {
    w1[i] = (float)rand() / RAND_MAX_CUSTOM * 6 - 3;
  }
  for (int i = 0; i < hidden_size * out_size; i++) {
    w2[i] = (float)rand() / RAND_MAX_CUSTOM * 6 - 3;
  }
  // dump(in, batch_size * in_size, "in");
  printf("%s:\n[", "in");
  for (int i = 0; i < batch_size * in_size; i++) {
    printf("%f", in[i]);
    if (i < batch_size * in_size - 1) {
      printf(", ");
    }
  }
  printf("]\n");
  // dump(w1, in_size * hidden_size, "w1");
  printf("%s:\n[", "w1");
  for (int i = 0; i < in_size * hidden_size; i++) {
    printf("%f", w1[i]);
    if (i < in_size * hidden_size - 1) {
      printf(", ");
    }
  }
  printf("]\n");
  // dump(w2, hidden_size * out_size, "w2");
  printf("%s:\n[", "w2");
  for (int i = 0; i < hidden_size * out_size; i++) {
    printf("%f", w2[i]);
    if (i < hidden_size * out_size - 1) {
      printf(", ");
    }
  }
  printf("]\n");
  mlp(in, w1, w2, out, batch_size, in_size, hidden_size, out_size);
  //   dump(out, batch_size * out_size, "out");
  printf("%s:\n[", "out");
  for (int i = 0; i < batch_size * out_size; i++) {
    printf("%f", out[i]);
    if (i < batch_size * out_size - 1) {
      printf(", ");
    }
  }
  printf("]\n");
  return 0;
}