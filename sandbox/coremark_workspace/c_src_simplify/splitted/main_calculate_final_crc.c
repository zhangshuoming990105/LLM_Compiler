#include <stdint.h>

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

u16 crc16(short newval, u16 crc);

u16 calculate_final_crc(list_head *finder, u16 retval) {
    while (finder) {
        retval = crc16(finder->info->data16, retval);
        finder = finder->next;
    }
    return retval;
}
