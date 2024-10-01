#include <stdlib.h>

int my_strncmp(const char *str1, const char *str2, const int n)
{
 int i;

 i = -1;
 while (str1[++i] && i < n && str1[i] == str2[i]);
 if (str1[i] - str2[i] < 0)
  return (-1);
 else if (str1[i] - str2[i] > 0)
  return (1);
 else
  return (0);
}