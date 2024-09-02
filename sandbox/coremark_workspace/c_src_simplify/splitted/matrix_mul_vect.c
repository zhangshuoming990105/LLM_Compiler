void matrix_mul_vect(unsigned N, int *C, short *A, short *B) {
  unsigned i, j;
  for (i = 0; i < N; i++) {
    C[i] = 0;
    for (j = 0; j < N; j++) {
      C[i] += (int)A[i * N + j] * (int)B[j];
    }
  }
}