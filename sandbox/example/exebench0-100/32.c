#include <stdio.h>

#include <time.h>

#include <stdlib.h>

#include <ctype.h>

int retPosVector(char letra, char alfabeto[]) {
  int i;

  for (i = 0; alfabeto[i]; i++) {
    if (alfabeto[i] == letra) {
      return i;
    }
  }
}