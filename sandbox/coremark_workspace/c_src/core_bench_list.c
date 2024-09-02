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

u16 crc16(short newval, u16 crc);
u16 crcu16(u16 newval, u16 crc);
list_head *core_list_find(list_head *list, list_data *info);
list_head *core_list_reverse(list_head *list);
list_head *core_list_remove(list_head *item);
list_head *core_list_undo_remove(list_head *item_removed,
                                 list_head *item_modified);
typedef int (*list_cmp)(list_data *a, list_data *b, core_results *res);
list_head *core_list_mergesort(list_head *list, list_cmp cmp,
                               core_results *res);
int cmp_idx(list_data *a, list_data *b, core_results *res);
int cmp_complex(list_data *a, list_data *b, core_results *res);

u16 core_bench_list(core_results *res, short finder_idx) {
  u16 retval = 0;
  u16 found = 0, missed = 0;
  list_head *list = res->list;
  short find_num = res->seed3;
  list_head *this_find;
  list_head *finder, *remover;
  list_data info = {0};
  short i;

  info.idx = finder_idx;
  for (i = 0; i < find_num; i++) {
    info.data16 = (i & 0xff);
    this_find = core_list_find(list, &info);
    list = core_list_reverse(list);
    if (this_find == NULL) {
      missed++;
      retval += (list->next->info->data16 >> 8) & 1;
    } else {
      found++;
      if (this_find->info->data16 & 0x1)
        retval += (this_find->info->data16 >> 9) & 1;
      if (this_find->next != NULL) {
        finder = this_find->next;
        this_find->next = finder->next;
        finder->next = list->next;
        list->next = finder;
      }
    }
    if (info.idx >= 0)
      info.idx++;
  }
  retval += found * 4 - missed;
  if (finder_idx > 0)
    list = core_list_mergesort(list, cmp_complex, res);
  remover = core_list_remove(list->next);
  finder = core_list_find(list, &info);
  if (!finder)
    finder = list->next;
  while (finder) {
    retval = crc16(list->info->data16, retval);
    finder = finder->next;
  }
  remover = core_list_undo_remove(remover, list->next);
  list = core_list_mergesort(list, cmp_idx, NULL);
  finder = list->next;
  while (finder) {
    retval = crc16(list->info->data16, retval);
    finder = finder->next;
  }
  return retval;
}