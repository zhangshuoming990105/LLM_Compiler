typedef unsigned short u16;
typedef unsigned char u8;
u16 crc16(short newval, u16 crc);
u16 crcu32(unsigned newval, u16 crc) {
  crc = crc16((short)newval, crc);
  crc = crc16((short)(newval >> 16), crc);
  return crc;
}