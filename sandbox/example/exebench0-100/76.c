#include <stdio.h>

#include <stdlib.h>

#include <string.h>

#include <ctype.h>

int isspec(char c) {
  return (((c >= '!') && (c <= '/')) || (c >= ':' && c <= '@') ||
          ((c >= '[') && (c <= '`')) || ((c >= '{') && (c <= 'DEL')));
}