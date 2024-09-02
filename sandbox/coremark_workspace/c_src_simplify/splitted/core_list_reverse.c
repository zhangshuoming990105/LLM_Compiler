#include <stdio.h>
typedef struct list_data_s {
  short data16;
  short idx;
} list_data;

typedef struct list_head_s {
  struct list_head_s *next;
  struct list_data_s *info;
} list_head;

list_head *core_list_reverse(list_head *list) {
  list_head *next = NULL, *tmp;
  while (list) {
    tmp = list->next;
    list->next = next;
    next = list;
    list = tmp;
  }
  return next;
}