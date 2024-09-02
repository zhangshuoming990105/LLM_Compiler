typedef unsigned short u16;
typedef unsigned char u8;
u16 crcu8(u8 data, u16 crc) {
  u8 i = 0, x16 = 0, carry = 0;

  for (i = 0; i < 8; i++) {
    x16 = (u8)((data & 1) ^ ((u8)crc & 1));
    data >>= 1;

    if (x16 == 1) {
      crc ^= 0x4002;
      carry = 1;
    } else
      carry = 0;
    crc >>= 1;
    if (carry)
      crc |= 0x8000;
    else
      crc &= 0x7fff;
  }
  return crc;
}