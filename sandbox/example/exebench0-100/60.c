#include <stdlib.h> /* Include standard library header */

#include <math.h> /* Include math library header */

#include <string.h> /* Include string function header */

#include <ctype.h> /* Include character function header */

#include <limits.h> /* define LONG_MIN and LONG_MAX */

int valid_serial(char *carray) {
  int i, code, num[10], sumo = 0, sume = 0, sumss = 0;

  for (i = 0; i < 10; i++) {
    code = carray[i];
    num[i] = code - 0x30;
    if ((code < 0x30) || (code > 0x39)) {
      return 0;
    }
  }

  sumo = num[0] + num[2] + num[4];
  sumo = sumo - (sumo / 10) * 10;

  sume = num[1] + num[3] + num[5];
  sume = sume - (sume / 10) * 10;

  sumss = num[0] + num[1] + num[2] + num[3] + num[4] + num[5] + sumo + sume;

  if ((sumo != num[6]) || (sume != num[7]) ||
      (sumss != (10 * num[8] + num[9]))) {
    return 0;
  }

  return 1;
}