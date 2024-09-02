#define bit_extract(x, from, to) (((x) >> (from)) & (~(0xffffffff << (to))))

void matrix_mul_matrix_bitextract(unsigned N, int *C, short *A, short *B) {
  unsigned i, j, k;
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      C[i * N + j] = 0;
      for (k = 0; k < N; k++) {
        int tmp = (int)A[i * N + k] * (int)B[k * N + j];
        C[i * N + j] += bit_extract(tmp, 2, 4) * bit_extract(tmp, 5, 7);
      }
    }
  }
}