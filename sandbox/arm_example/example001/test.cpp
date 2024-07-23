#include <iostream>
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