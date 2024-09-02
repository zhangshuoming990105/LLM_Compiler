short matrix_sum(unsigned N, int *C, short clipval) {
  int tmp = 0, prev = 0, cur = 0;
  short ret = 0;
  unsigned i, j;
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      cur = C[i * N + j];
      tmp += cur;
      if (tmp > clipval) {
        ret += 10;
        tmp = 0;
      } else {
        ret += (cur > prev) ? 1 : 0;
      }
      prev = cur;
    }
  }
  return ret;
}