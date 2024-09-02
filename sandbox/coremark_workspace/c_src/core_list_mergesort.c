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

typedef int (*list_cmp)(list_data *a, list_data *b, core_results *res);

list_head *core_list_mergesort(list_head *list, list_cmp cmp,
                               core_results *res) {
  list_head *p, *q, *e, *tail;
  int insize, nmerges, psize, qsize, i;
  insize = 1;
  while (1) {
    p = list;
    list = NULL;
    tail = NULL;
    nmerges = 0;
    while (p) {
      nmerges++;
      q = p;
      psize = 0;
      for (i = 0; i < insize; i++) {
        psize++;
        q = q->next;
        if (!q)
          break;
      }
      qsize = insize;
      while (psize > 0 || (qsize > 0 && q)) {
        if (psize == 0) {
          e = q;
          q = q->next;
          qsize--;
        } else if (qsize == 0 || !q) {
          e = p;
          p = p->next;
          psize--;
        } else if (cmp(p->info, q->info, res) <= 0) {
          e = p;
          p = p->next;
          psize--;
        } else {
          e = q;
          q = q->next;
          qsize--;
        }
        if (tail) {
          tail->next = e;
        } else {
          list = e;
        }
        tail = e;
      }
      p = q;
    }
    tail->next = NULL;
    if (nmerges <= 1)
      return list;
    insize *= 2;
  }
}