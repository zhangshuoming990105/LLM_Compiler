#include <stdint.h>
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

void start_time(void);
void stop_time(void);
double time_in_secs(clock_t ticks);
clock_t get_time(void);
void *iterate(void *pres);

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