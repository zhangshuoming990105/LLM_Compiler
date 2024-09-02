#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
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

// Function prototypes
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
unsigned core_init_matrix(unsigned blksize, void *memblk, int seed, mat_params *p);
u16 crc16(short newval, u16 crc);
void initialize_results(core_results *results, unsigned size);
void allocate_memory_blocks(core_results *results, unsigned num_algorithms);
void initialize_data_structures(core_results *results);
unsigned determine_iterations(core_results *results);
void print_results(const core_results *results, clock_t total_time, u16 seedcrc, int known_id);

// Global variables
static const u16 list_known_crc[] = {0xd4b0, 0x3340, 0x6a79, 0xe714, 0xe3c1};
static const u16 matrix_known_crc[] = {0xbe52, 0x1199, 0x5608, 0x1fd7, 0x0747};
static const u16 state_known_crc[] = {0x5e47, 0x39bf, 0xe5a4, 0x8e3a, 0x8d84};
struct timespec start_time_val, stop_time_val;
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