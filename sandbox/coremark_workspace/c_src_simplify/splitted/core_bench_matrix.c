#include <time.h>
#include <stdint.h>
#include <stdio.h>
typedef unsigned short u16;
typedef struct MAT_PARAMS_S {
  int N;
  short *A;
  short *B;
  int *C;
} mat_params;
u16 crc16(short newval, u16 crc);
short matrix_test(unsigned N, int *C, short *A, short *B, short val);

u16 core_bench_matrix(mat_params *p, short seed, u16 crc) {
  unsigned N = p->N;
  int *C = p->C;
  short *A = p->A;
  short *B = p->B;
  short val = (short)seed;

  crc = crc16(matrix_test(N, C, A, B, val), crc);

  return crc;
}