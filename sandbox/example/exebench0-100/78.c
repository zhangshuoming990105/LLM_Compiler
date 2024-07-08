#include <stdio.h>

#include <string.h>

#include <stdlib.h>

#include <stdint.h>

#include <math.h>

int cat_nums(char *str_out, char *str) {

  int i = 0, j = 0;
  while (str[i] != '\0') {
    if (str[i] >= '0' && str[i] <= '9') {
      str_out[j++] = str[i];
    }
    i++;
  }
  str_out[j] = '\0';
  return (j);
}