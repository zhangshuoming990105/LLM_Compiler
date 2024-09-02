typedef struct list_data_s {
  short data16;
  short idx;
} list_data;

typedef struct list_head_s {
  struct list_head_s *next;
  struct list_data_s *info;
} list_head;

void copy_info(list_data *to, list_data *from) {
  to->data16 = from->data16;
  to->idx = from->idx;
}