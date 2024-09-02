#include <stdint.h>
#include <stdio.h>
#include <time.h>

typedef unsigned short u16;
typedef unsigned char u8;

typedef struct core_portable_s {
    u8 portable_id;
} core_portable;

typedef struct list_head_s {
    struct list_head_s *next;
    struct list_data_s *info;
} list_head;

typedef struct mat_params_s {
    int N;
    short *A;
    short *B;
    int *C;
} mat_params;

typedef struct results_s {
    short seed1;
    short seed2;
    short seed3;
    void *memblock[4];
    unsigned size;
    unsigned iterations;
    unsigned execs;
    list_head *list;
    mat_params mat;
    u16 crc;
    u16 crclist;
    u16 crcmatrix;
    u16 crcstate;
    short err;
    core_portable port;
} core_results;

double time_in_secs(clock_t ticks);

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