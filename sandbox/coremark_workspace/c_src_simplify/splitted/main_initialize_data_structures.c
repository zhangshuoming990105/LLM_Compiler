#include <stdint.h>

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

list_head *core_list_init(unsigned blksize, list_head *memblock, short seed);
void core_init_state(unsigned size, short seed, u8 *p);
unsigned core_init_matrix(unsigned blksize, void *memblk, int seed, mat_params *p);

void initialize_data_structures(core_results *results) {
    results->list = core_list_init(results->size, results->memblock[1], results->seed1);
    core_init_matrix(results->size, results->memblock[2],
                     (int)results->seed1 | (((int)results->seed2) << 16),
                     &(results->mat));
    core_init_state(results->size, results->seed1, results->memblock[3]);
}