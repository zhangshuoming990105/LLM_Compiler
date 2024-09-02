#include <stdint.h>
#include <stdlib.h>

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

void *portable_malloc(size_t size);

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