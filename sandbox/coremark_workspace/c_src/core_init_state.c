typedef unsigned short u16;
typedef unsigned char u8;

/* Default initialization patterns */
static u8 *intpat[4] = {(u8 *)"5012", (u8 *)"1234", (u8 *)"-874", (u8 *)"+122"};
static u8 *floatpat[4] = {(u8 *)"35.54400", (u8 *)".1234500", (u8 *)"-110.700",
                          (u8 *)"+0.64400"};
static u8 *scipat[4] = {(u8 *)"5.500e+3", (u8 *)"-.123e-2", (u8 *)"-87e+832",
                        (u8 *)"+0.6e-12"};
static u8 *errpat[4] = {(u8 *)"T0.3e-1F", (u8 *)"-T.T++Tq", (u8 *)"1T3.4e4z",
                        (u8 *)"34.0e-T^"};

void core_init_state(unsigned size, short seed, u8 *p) {
  unsigned total = 0, next = 0, i;
  u8 *buf = 0;
  size--;
  next = 0;
  while ((total + next + 1) < size) {
    if (next > 0) {
      for (i = 0; i < next; i++)
        *(p + total + i) = buf[i];
      *(p + total + i) = ',';
      total += next + 1;
    }
    seed++;
    switch (seed & 0x7) {
    case 0: /* int */
    case 1: /* int */
    case 2: /* int */
      buf = intpat[(seed >> 3) & 0x3];
      next = 4;
      break;
    case 3: /* float */
    case 4: /* float */
      buf = floatpat[(seed >> 3) & 0x3];
      next = 8;
      break;
    case 5: /* scientific */
    case 6: /* scientific */
      buf = scipat[(seed >> 3) & 0x3];
      next = 8;
      break;
    case 7: /* invalid */
      buf = errpat[(seed >> 3) & 0x3];
      next = 8;
      break;
    default: /* Never happen, just to make some compilers happy */
      break;
    }
  }
  size++;
  while (total < size) { /* fill the rest with 0 */
    *(p + total) = 0;
    total++;
  }
}