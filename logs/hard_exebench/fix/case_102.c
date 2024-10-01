#include <stdio.h>

#include <stdlib.h>

int WanNum(int n)
{
 int i, tmp = 0;
 for(i = 1;i < n;i++)
  if(n % i == 0)
   tmp += i;
 if(tmp == n)
  return 1;
 else
  return 0;
}