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
int cmp_idx(list_data *a, list_data *b, core_results *res) {
  if (res == NULL) {
    a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16 >> 8));
    b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16 >> 8));
  }
  return a->idx - b->idx;
}