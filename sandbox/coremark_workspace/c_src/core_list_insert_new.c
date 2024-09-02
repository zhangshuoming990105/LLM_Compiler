#include <stdio.h>
typedef struct list_data_s {
  short data16;
  short idx;
} list_data;

typedef struct list_head_s {
  struct list_head_s *next;
  struct list_data_s *info;
} list_head;

void copy_info(list_data *to, list_data *from);

list_head *core_list_insert_new(list_head *insert_point, list_data *info,
                                list_head **memblock, list_data **datablock,
                                list_head *memblock_end,
                                list_data *datablock_end) {
  list_head *newitem;

  if ((*memblock + 1) >= memblock_end)
    return NULL;
  if ((*datablock + 1) >= datablock_end)
    return NULL;

  newitem = *memblock;
  (*memblock)++;
  newitem->next = insert_point->next;
  insert_point->next = newitem;

  newitem->info = *datablock;
  (*datablock)++;
  copy_info(newitem->info, info);

  return newitem;
}