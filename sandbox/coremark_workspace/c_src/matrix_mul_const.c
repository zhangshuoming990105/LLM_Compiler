void matrix_mul_const(unsigned N, int *C, short *A, short val) {
  unsigned i, j;
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      C[i * N + j] = (int)A[i * N + j] * (int)val;
    }
  }
}