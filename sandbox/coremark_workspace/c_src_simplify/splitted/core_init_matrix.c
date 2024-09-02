#include <stdint.h>
#include <stdio.h>
typedef unsigned short u16;
/* align an offset to point to a 32b value */
#define align_mem(x) (void *)(4 + (((uintptr_t)(x)-1) & ~3))

#define matrix_clip(x, y) ((y) ? (x) & 0x0ff : (x) & 0x0ffff)

typedef struct MAT_PARAMS_S {
  int N;
  short *A;
  short *B;
  int *C;
} mat_params;

unsigned core_init_matrix(unsigned blksize, void *memblk, int seed,
                          mat_params *p) {
  unsigned N = 0;
  short *A;
  short *B;
  int order = 1;
  short val;
  unsigned i = 0, j = 0;
  if (seed == 0)
    seed = 1;
  while (j < blksize) {
    i++;
    j = i * i * 2 * 4;
  }
  N = i - 1;
  A = (short *)align_mem(memblk);
  B = A + N * N;

  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      seed = ((order * seed) % 65536);
      val = (seed + order);
      val = matrix_clip(val, 0);
      B[i * N + j] = val;
      val = (val + order);
      val = matrix_clip(val, 1);
      A[i * N + j] = val;
      order++;
    }
  }

  p->A = A;
  p->B = B;
  p->C = (int *)align_mem(B + N * N);
  p->N = N;
  return N;
}