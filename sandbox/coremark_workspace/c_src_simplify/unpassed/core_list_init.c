#include <stdint.h>
#include <stdio.h>
typedef unsigned short u16;
typedef unsigned char u8;
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

typedef struct CORE_PORTABLE_S {
  u8 portable_id;
} core_portable;

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

list_head *core_list_insert_new(list_head *insert_point, list_data *info,
                                list_head **memblock, list_data **datablock,
                                list_head *memblock_end,
                                list_data *datablock_end);
typedef int (*list_cmp)(list_data *a, list_data *b, core_results *res);
list_head *core_list_mergesort(list_head *list, list_cmp cmp,
                               core_results *res);
int cmp_idx(list_data *a, list_data *b, core_results *res);

list_head *core_list_init(unsigned blksize, list_head *memblock, short seed) {
  unsigned per_item = 16 + sizeof(struct list_data_s);
  unsigned size = (blksize / per_item) - 2;
  list_head *memblock_end = memblock + size;
  list_data *datablock = (list_data *)(memblock_end);
  list_data *datablock_end = datablock + size;
  unsigned i;
  list_head *finder, *list = memblock;
  list_data info;
  list->next = NULL;
  list->info = datablock;
  list->info->idx = 0x0000;
  list->info->data16 = (short)0x8080;
  memblock++;
  datablock++;
  info.idx = 0x7fff;
  info.data16 = (short)0xffff;
  core_list_insert_new(list, &info, &memblock, &datablock, memblock_end,
                       datablock_end);
  for (i = 0; i < size; i++) {
    u16 datpat = ((u16)(seed ^ i) & 0xf);
    u16 dat = (datpat << 3) | (i & 0x7);
    info.data16 = (dat << 8) | dat;
    core_list_insert_new(list, &info, &memblock, &datablock, memblock_end,
                         datablock_end);
  }
  finder = list->next;
  i = 1;
  while (finder->next != NULL) {
    if (i < size / 5)
      finder->info->idx = i++;
    else {
      u16 pat = (u16)(i++ ^ seed);
      finder->info->idx = 0x3fff & (((i & 0x07) << 8) | pat);
    }
    finder = finder->next;
  }
  list = core_list_mergesort(list, cmp_idx, NULL);
  return list;
}