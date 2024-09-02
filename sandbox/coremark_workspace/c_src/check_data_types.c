#include <stdio.h>
#include <stdint.h>

typedef unsigned short u16;
typedef unsigned char u8;

u8 check_data_types() {
  u8 retval = 0;
  if (sizeof(u8) != 1) {
    printf("ERROR: u8 is not an 8b datatype!\n");
    retval++;
  }
  if (sizeof(u16) != 2) {
    printf("ERROR: u16 is not a 16b datatype!\n");
    retval++;
  }
  if (sizeof(short) != 2) {
    printf("ERROR: short is not a 16b datatype!\n");
    retval++;
  }
  if (sizeof(int) != 4) {
    printf("ERROR: int is not a 32b datatype!\n");
    retval++;
  }
  if (sizeof(unsigned) != 4) {
    printf("ERROR: unsigned is not a 32b datatype!\n");
    retval++;
  }
  if (sizeof(uintptr_t) != sizeof(int *)) {
    printf("ERROR: uintptr_t is not a datatype that holds an int pointer!\n");
    retval++;
  }
  if (retval > 0) {
    printf("ERROR: Please modify the datatypes in core_portme.h!\n");
  }
  return retval;
}