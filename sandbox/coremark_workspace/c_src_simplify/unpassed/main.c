#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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

// Global variables
struct timespec start_time_val, stop_time_val;
static const u16 list_known_crc[] = {0xd4b0, 0x3340, 0x6a79, 0xe714, 0xe3c1};
static const u16 matrix_known_crc[] = {0xbe52, 0x1199, 0x5608, 0x1fd7, 0x0747};
static const u16 state_known_crc[] = {0x5e47, 0x39bf, 0xe5a4, 0x8e3a, 0x8d84};

// Helper functions
void initialize_results(core_results *results, unsigned size) {
    results->seed1 = 0;
    results->seed2 = 0;
    results->seed3 = 0x66;
    results->iterations = 0;
    results->execs = 7;
    results->size = size;
    results->err = 0;
    results->memblock[0] = portable_malloc(size);
}

void allocate_memory_blocks(core_results *results, unsigned num_algorithms) {
    results->size /= num_algorithms;
    for (int i = 0; i < 3; i++) {
        results->memblock[i + 1] = (char *)(results->memblock[0]) + results->size * i;
    }
}

void initialize_data_structures(core_results *results) {
    results->list = core_list_init(results->size, results->memblock[1], results->seed1);
    core_init_matrix(results->size, results->memblock[2],
                     (int)results->seed1 | (((int)results->seed2) << 16),
                     &(results->mat));
    core_init_state(results->size, results->seed1, results->memblock[3]);
}

unsigned determine_iterations(core_results *results) {
    double secs_passed = 0;
    results->iterations = 1;
    while (secs_passed < 1.0) {
        results->iterations *= 10;
        start_time();
        iterate(results);
        stop_time();
        secs_passed = time_in_secs(get_time());
    }
    unsigned divisor = (unsigned)secs_passed;
    return divisor == 0 ? 11 : results->iterations * (1 + 10 / divisor);
}

void print_results(const core_results *results, clock_t total_time, u16 seedcrc, int known_id) {
    printf("CoreMark Size    : %lu\n", (long unsigned)results->size);
    printf("Total ticks      : %lu\n", (long unsigned)total_time);
    printf("Total time (secs): %f\n", time_in_secs(total_time));
    
    double secs = time_in_secs(total_time);
    if (secs > 0) {
        printf("Iterations/Sec   : %f\n", results->iterations / secs);
    }
    if (secs < 10) {
        printf("ERROR! Must execute for at least 10 secs for a valid result!\n");
    }

    printf("Iterations       : %lu\n", (long unsigned)results->iterations);
    printf("Compiler version : AICC 1.0\n");
    printf("seedcrc          : 0x%04x\n", seedcrc);
    
    if (results->execs & 1) printf("crclist       : 0x%04x\n", results->crclist);
    if (results->execs & 2) printf("crcmatrix     : 0x%04x\n", results->crcmatrix);
    if (results->execs & 4) printf("crcstate      : 0x%04x\n", results->crcstate);
    printf("crcfinal      : 0x%04x\n", results->crc);

    if (known_id == 3) {
        printf("Function Level CoreMark 1.0 : %f by AICC 1.0 / Heap\n",
               results->iterations / secs);
    }
}

int main() {
    core_results results;
    u16 seedcrc = 0;
    int total_errors = 0;
    int known_id = -1;
    const unsigned num_algorithms = 3;

    portable_init(&(results.port));
    initialize_results(&results, 2000);
    allocate_memory_blocks(&results, num_algorithms);
    initialize_data_structures(&results);

    results.iterations = determine_iterations(&results);

    start_time();
    iterate(&results);
    stop_time();
    clock_t total_time = get_time();

    seedcrc = crc16(results.seed1, seedcrc);
    seedcrc = crc16(results.seed2, seedcrc);
    seedcrc = crc16(results.seed3, seedcrc);
    seedcrc = crc16(results.size, seedcrc);

    if (seedcrc == 0xe9f5) {
        known_id = 3;
        printf("2K performance run parameters for coremark.\n");
    } else {
        total_errors = -1;
    }

    if (known_id >= 0) {
        if ((results.execs & 1) && (results.crclist != list_known_crc[known_id])) {
            printf("ERROR! list crc 0x%04x - should be 0x%04x\n", results.crclist, list_known_crc[known_id]);
            results.err++;
        }
        if ((results.execs & 2) && (results.crcmatrix != matrix_known_crc[known_id])) {
            printf("ERROR! matrix crc 0x%04x - should be 0x%04x\n", results.crcmatrix, matrix_known_crc[known_id]);
            results.err++;
        }
        if ((results.execs & 4) && (results.crcstate != state_known_crc[known_id])) {
            printf("ERROR! state crc 0x%04x - should be 0x%04x\n", results.crcstate, state_known_crc[known_id]);
            results.err++;
        }
        total_errors += results.err;
    }

    total_errors += check_data_types();

    print_results(&results, total_time, seedcrc, known_id);

    if (total_errors == 0) {
        printf("Correct operation validated. See README.md for run and reporting rules.\n");
    } else if (total_errors > 0) {
        printf("Errors detected\n");
    } else {
        printf("Cannot validate operation for these seed values, please compare with results on a known platform.\n");
    }

    portable_free(results.memblock[0]);
    portable_fini(&(results.port));

    return 0;
}