#include <stdint.h>
#include <stdio.h>
typedef unsigned short u16;

#define matrix_big(x) (0xf000 | (x))

u16 crc16(short newval, u16 crc);
short matrix_sum(unsigned N, int *C, short clipval);
void matrix_mul_const(unsigned N, int *C, short *A, short val);
void matrix_mul_vect(unsigned N, int *C, short *A, short *B);
void matrix_mul_matrix(unsigned N, int *C, short *A, short *B);
void matrix_mul_matrix_bitextract(unsigned N, int *C, short *A, short *B);
void matrix_add_const(unsigned N, short *A, short val);

short matrix_test(unsigned N, int *C, short *A, short *B, short val) {
  u16 crc = 0;
  short clipval = matrix_big(val);

  matrix_add_const(N, A, val);
  matrix_mul_const(N, C, A, val);
  crc = crc16(matrix_sum(N, C, clipval), crc);
  matrix_mul_vect(N, C, A, B);
  crc = crc16(matrix_sum(N, C, clipval), crc);
  matrix_mul_matrix(N, C, A, B);
  crc = crc16(matrix_sum(N, C, clipval), crc);
  matrix_mul_matrix_bitextract(N, C, A, B);
  crc = crc16(matrix_sum(N, C, clipval), crc);

  matrix_add_const(N, A, -val);
  return crc;
}