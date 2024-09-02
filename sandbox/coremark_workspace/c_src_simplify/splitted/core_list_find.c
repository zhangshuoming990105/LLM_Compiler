typedef struct list_data_s {
  short data16;
  short idx;
} list_data;

typedef struct list_head_s {
  struct list_head_s *next;
  struct list_data_s *info;
} list_head;

list_head *core_list_find(list_head *list, list_data *info) {
  if (info->idx >= 0) {
    while (list && (list->info->idx != info->idx))
      list = list->next;
    return list;
  } else {
    while (list && ((list->info->data16 & 0xff) != info->data16))
      list = list->next;
    return list;
  }
}