#include <stdio.h>

#include <stdlib.h>

#include <string.h>

#include <ctype.h>

#include <limits.h>

char get_gap_qual(int *window) {
  int score_sum = 0;
  int weight_sum = 0;
  int weight = 1;
  int i;
  for (i = 0; i < 4*2; i++) {
    if (window[i] != -1) {
      score_sum += window[i] * weight;
      weight_sum += weight;
    }

    if (i < 4 - 1) {
      weight++;
    } else if (i > 4 - 1) {
      weight--;
    }
  }
  if (weight_sum > 0) {

    return (char) (score_sum/weight_sum);
  } else {
    return '\0';
  }
}