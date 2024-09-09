#include <stdio.h>
void foo(int x, int y) {
  int a1, a2, a3;
  double d[10];              // -96%rbp, [-96, -16)
  printf("a1 is %d\n", a1);  // -4(%rbp)
  printf("a2 is %d\n", a2);  // -8(%rbp)
  printf("a3 is %d\n", a3);  // -12(%rbp)
  printf("d is %f\n", d[0]); // -96(%rbp)
  printf("d is %f\n", d[9]); // -24(%rbp)
  // x: -100(%rbp)
  // y: -104(%rbp)
}

int main() {
  foo(1, 2);
  return 0;
}