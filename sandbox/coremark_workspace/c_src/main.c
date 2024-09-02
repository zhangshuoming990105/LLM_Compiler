#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
typedef unsigned short u16;
typedef unsigned char u8;

typedef struct CORE_PORTABLE_S {
  u8 portable_id;
} core_portable;

typedef struct list_data_s {
  short data16;
  short idx;
} list_data;

typedef struct list_head_s {
  struct list_head_s *next;
  struct list_data_s *info;
} list_head;

typedef struct MAT_PARAMS_S {
  int N;
  short *A;
  short *B;
  int *C;
} mat_params;

typedef struct RESULTS_S {

  short seed1;
  short seed2;
  short seed3;
  void *memblock[4];
  unsigned size;
  unsigned iterations;
  unsigned execs;
  struct list_head_s *list;
  mat_params mat;

  u16 crc;
  u16 crclist;
  u16 crcmatrix;
  u16 crcstate;
  short err;

  core_portable port;
} core_results;

u16 crc16(short newval, u16 crc);
u16 crcu16(u16 newval, u16 crc);
void portable_init(core_portable *p);
void portable_fini(core_portable *p);
void *portable_malloc(size_t size);
void portable_free(void *p);
u8 check_data_types();
void *iterate(void *pres);

void start_time(void);
void stop_time(void);
clock_t get_time(void);
double time_in_secs(clock_t ticks);

list_head *core_list_init(unsigned blksize, list_head *memblock, short seed);
void core_init_state(unsigned size, short seed, u8 *p);
unsigned core_init_matrix(unsigned blksize, void *memblk, int seed,
                          mat_params *p);

struct timespec start_time_val, stop_time_val;
static u16 list_known_crc[] = {(u16)0xd4b0, (u16)0x3340, (u16)0x6a79,
                               (u16)0xe714, (u16)0xe3c1};
static u16 matrix_known_crc[] = {(u16)0xbe52, (u16)0x1199, (u16)0x5608,
                                 (u16)0x1fd7, (u16)0x0747};
static u16 state_known_crc[] = {(u16)0x5e47, (u16)0x39bf, (u16)0xe5a4,
                                (u16)0x8e3a, (u16)0x8d84};

int main() {
  u16 i, j = 0, num_algorithms = 3;
  short known_id = -1, total_errors = 0;
  u16 seedcrc = 0;
  clock_t total_time;
  core_results results[1];
  portable_init(&(results[0].port));
  results[0].seed1 = 0;
  results[0].seed2 = 0;
  results[0].seed3 = 0x66;
  results[0].iterations = 0;
  results[0].execs = 7;
  results[0].size = 2000;
  results[0].memblock[0] = portable_malloc(results[i].size);
  results[0].err = 0;
  results[0].size = results[0].size / num_algorithms;
  for (i = 0; i < 3; i++) {
    unsigned ctx;
    for (ctx = 0; ctx < 1; ctx++)
      results[ctx].memblock[i + 1] =
          (char *)(results[ctx].memblock[0]) + results[0].size * j;
    j++;
  }
  results[0].list =
      core_list_init(results[0].size, results[0].memblock[1], results[0].seed1);
  core_init_matrix(results[0].size, results[0].memblock[2],
                   (int)results[0].seed1 | (((int)results[0].seed2) << 16),
                   &(results[0].mat));
  core_init_state(results[0].size, results[0].seed1, results[0].memblock[3]);

  /* automatically determine number of iterations if not set */
  if (results[0].iterations == 0) {
    double secs_passed = 0;
    unsigned divisor;
    results[0].iterations = 1;
    while (secs_passed < (double)1) {
      results[0].iterations *= 10;
      start_time();
      iterate(&results[0]);
      stop_time();
      secs_passed = time_in_secs(get_time());
    }
    /* now we know it executes for at least 1 sec, set actual run time at
     * about 10 secs */
    divisor = (unsigned)secs_passed;
    if (divisor == 0) /* some machines cast float to int as 0 since this
                         conversion is not defined by ANSI, but we know at
                         least one second passed */
      divisor = 1;
    results[0].iterations *= 1 + 10 / divisor;
  }
  /* perform actual benchmark */
  start_time();
  iterate(&results[0]);
  stop_time();
  total_time = get_time();
  /* get a function of the input to report */
  seedcrc = crc16(results[0].seed1, seedcrc);
  seedcrc = crc16(results[0].seed2, seedcrc);
  seedcrc = crc16(results[0].seed3, seedcrc);
  seedcrc = crc16(results[0].size, seedcrc);

  switch (seedcrc) { /* test known output for common seeds */
  case 0xe9f5:       /* seed1=0, seed2=0, seed3=0x66, size 666 per algorithm */
    known_id = 3;
    printf("2K performance run parameters for coremark.\n");
    break;
  default:
    total_errors = -1;
    break;
  }
  if (known_id >= 0) {
    results[i].err = 0;
    if ((results[i].execs & 1) &&
        (results[i].crclist != list_known_crc[known_id])) {
      printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n", i,
             results[i].crclist, list_known_crc[known_id]);
      results[i].err++;
    }
    if ((results[i].execs & 2) &&
        (results[i].crcmatrix != matrix_known_crc[known_id])) {
      printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n", i,
             results[i].crcmatrix, matrix_known_crc[known_id]);
      results[i].err++;
    }
    if ((results[i].execs & 4) &&
        (results[i].crcstate != state_known_crc[known_id])) {
      printf("[%u]ERROR! state crc 0x%04x - should be 0x%04x\n", i,
             results[i].crcstate, state_known_crc[known_id]);
      results[i].err++;
    }
    total_errors += results[i].err;
  }
  total_errors += check_data_types();
  /* and report results */
  printf("CoreMark Size    : %lu\n", (long unsigned)results[0].size);
  printf("Total ticks      : %lu\n", (long unsigned)total_time);
  printf("Total time (secs): %f\n", time_in_secs(total_time));
  if (time_in_secs(total_time) > 0)
    printf("Iterations/Sec   : %f\n",
           1 * results[0].iterations / time_in_secs(total_time));
  if (time_in_secs(total_time) < 10) {
    printf("ERROR! Must execute for at least 10 secs for a valid result!\n");
    total_errors++;
  }

  printf("Iterations       : %lu\n", (long unsigned)results[0].iterations);
  printf("Compiler version : AICC 1.0\n");
  /* output for verification */
  printf("seedcrc          : 0x%04x\n", seedcrc);
  if (results[0].execs & 1)
    printf("[%d]crclist       : 0x%04x\n", i, results[i].crclist);
  if (results[0].execs & 2)
    printf("[%d]crcmatrix     : 0x%04x\n", i, results[i].crcmatrix);
  if (results[0].execs & 4)
    printf("[%d]crcstate      : 0x%04x\n", i, results[i].crcstate);
  printf("[%d]crcfinal      : 0x%04x\n", i, results[i].crc);
  if (total_errors == 0) {
    printf("Correct operation validated. See README.md for run and reporting "
           "rules.\n");
    if (known_id == 3) {
      printf("Function Level CoreMark 1.0 : %f by AICC 1.0",
             results[0].iterations / time_in_secs(total_time));
      printf(" / Heap");
      printf("\n");
    }
  }
  if (total_errors > 0)
    printf("Errors detected\n");
  if (total_errors < 0)
    printf("Cannot validate operation for these seed values, please compare "
           "with results on a known platform.\n");

  portable_free(results[0].memblock[0]);
  /* And last call any target specific code for finalizing */
  portable_fini(&(results[0].port));

  return 0;
}