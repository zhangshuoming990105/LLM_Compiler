typedef struct list_data_s {
  short data16;
  short idx;
} list_data;

typedef struct list_head_s {
  struct list_head_s *next;
  struct list_data_s *info;
} list_head;

list_head *core_list_undo_remove(list_head *item_removed,
                                 list_head *item_modified) {
  list_data *tmp;
  /* swap data pointers */
  tmp = item_removed->info;
  item_removed->info = item_modified->info;
  item_modified->info = tmp;
  /* and insert item */
  item_removed->next = item_modified->next;
  item_modified->next = item_removed;
  return item_removed;
}