#include <stdio.h>
int quant(int n, int m);

int main() {
  int n[10] = {10, -25, 30, -40, 50, 60, 70, -80, 90, 3}; // 10 elements
  int m[10] = {3, 5, 10, 20, 50, 100, -2, -10, 0, 100}; // 10 elements
  for (int i = 0; i < 10; i++) {
    printf("%d: quant(%d, %d) = %d\n", i, n[i], m[i], quant(n[i], m[i]));
  }
  return 0;
}