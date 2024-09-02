#include <stdio.h>

typedef unsigned short u16;
typedef unsigned char u8;

typedef struct CORE_PORTABLE_S {
  u8 portable_id;
} core_portable;


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
u16 core_bench_list(core_results *res, short finder_idx);

void *iterate(void *pres) {
  unsigned i;
  u16 crc;
  core_results *res = (core_results *)pres;
  unsigned iterations = res->iterations;
  res->crc = 0;
  res->crclist = 0;
  res->crcmatrix = 0;
  res->crcstate = 0;

  for (i = 0; i < iterations; i++) {
    crc = core_bench_list(res, 1);
    res->crc = crcu16(crc, res->crc);
    crc = core_bench_list(res, -1);
    res->crc = crcu16(crc, res->crc);
    if (i == 0)
      res->crclist = res->crc;
  }
  return NULL;
}