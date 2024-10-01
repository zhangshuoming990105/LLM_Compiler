#include <stdio.h>

#include <ctype.h>

int maxSum(int *a) {
   int max = 0, current = 0;
   int i;

   for (i = 0; a[i] != '\0'; i++) {
      current += a[i];

      if (current > max) max = current;
      else if (0 > current) current = 0;
   }
   return max;
}