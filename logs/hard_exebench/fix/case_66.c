#include <stdio.h>

#include <stdbool.h>

int
findLongest1s(int x)
{
 int k;
 int longest=0;
 int l1=0;
 int l2=0;
 int size = 8* sizeof(int);

 for(k=0; k < size; k++) {
  while (x >> k & 0x1) {
   l1++;
   k++;
  }

  if ((l1 + l2) > longest)
   longest = l1 + l2;

  l2 = l1;
  l1 = 0;

  if (((x >> k & 0x1) == 0x0) &&
   (x >> (k+1) & 0x1 == 0x0)) {
   l2 = 0;
   k++;
  } else
   if (l2)
    l1++;
 }

 return longest;
}