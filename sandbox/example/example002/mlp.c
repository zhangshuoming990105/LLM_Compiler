#include <stdio.h>
#include <stdlib.h>
#define RAND_MAX_CUSTOM 2147483647

void dump(float *arr, int size, char *name) {
  printf("%s:\n[", name);
  for (int i = 0; i < size; i++) {
    printf("%f", arr[i]);
    if (i < size - 1) {
      printf(", ");
    }
  }
  printf("]\n");
}

void matmul(float *A, float *B, float *C, int M, int N, int K) {
  // C[M][N] = A[M][K] * B[K][N]
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      C[i * N + j] = 0;
      for (int k = 0; k < K; k++) {
        C[i * N + j] += A[i * K + k] * B[k * N + j];
      }
    }
  }
}

void relu(float *in, float *out, int size) {
  for (int i = 0; i < size; i++) {
    out[i] = in[i] > 0 ? in[i] : 0;
  }
}

void mlp(float *in, float *w1, float *w2, float *out, int batch_size,
         int in_size, int hidden_size, int out_size) {
  float hidden1[batch_size * hidden_size];
  float hidden2[batch_size * hidden_size];
  matmul(in, w1, hidden1, batch_size, hidden_size, in_size);
  dump(hidden1, batch_size * hidden_size, "hidden1");
  relu(hidden1, hidden2, batch_size * hidden_size);
  dump(hidden2, batch_size * hidden_size, "hidden1_relu");
  matmul(hidden2, w2, out, batch_size, out_size, hidden_size);
}