int logicalShift(int x, int n) {
  int a = (x >> 31 & 1) << 32 + ~n;
  return (x ^ a << n) >> n ^ a;
}