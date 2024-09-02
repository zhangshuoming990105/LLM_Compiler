void matrix_add_const(unsigned N, short *A, short val) {
  unsigned i, j;
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      A[i * N + j] += val;
    }
  }
}