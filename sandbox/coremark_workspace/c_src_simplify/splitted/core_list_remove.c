#include <stdio.h>
typedef struct list_data_s {
  short data16;
  short idx;
} list_data;

typedef struct list_head_s {
  struct list_head_s *next;
  struct list_data_s *info;
} list_head;

list_head *core_list_remove(list_head *item) {
  list_data *tmp;
  list_head *ret = item->next;
  /* swap data pointers */
  tmp = item->info;
  item->info = ret->info;
  ret->info = tmp;
  /* and eliminate item */
  item->next = item->next->next;
  ret->next = NULL;
  return ret;
}