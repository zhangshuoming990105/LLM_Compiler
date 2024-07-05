#include <stdio.h>
int quant(int n, int m)
{
 int i, neg;

 neg = 0;
 if (n < 0) {
  neg++;
  n = -n;
 }

 i = n / m;
 if (n - m * i > m / 2)
  i += 1;
 i *= m;
 if (neg)
  i = -i;
 return(i);
}
int main() {
    int N[10] = {23, 46, 31, 45, 67, 89, 90, 12, 34, 56};
    int m = 6;
    for(int i = 0; i < 10; i++) {
        int res = quant(N[i], m);
        printf("%d: quant(%d, %d)=%d\n", i, N[i], m, res);
    }
    return 0;
}