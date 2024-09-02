void matrix_mul_matrix(unsigned N, int *C, short *A, short *B) {
  unsigned i, j, k;
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      C[i * N + j] = 0;
      for (k = 0; k < N; k++) {
        C[i * N + j] += (int)A[i * N + k] * (int)B[k * N + j];
      }
    }
  }
}