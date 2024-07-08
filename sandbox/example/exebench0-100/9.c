extern inline int JKMarray_idx(const int J, const int K, const int M) {
  return (((4 * J * J + 5) * J) / 3 + 2 * J * J + K * (2 * J + 1) + M);
}