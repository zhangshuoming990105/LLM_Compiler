#include <stdio.h>

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

extern short calc_func(short *pdata, core_results *res);

int cmp_complex(list_data *a, list_data *b, core_results *res) {
  short val1 = calc_func(&(a->data16), res);
  short val2 = calc_func(&(b->data16), res);
  return val1 - val2;
}