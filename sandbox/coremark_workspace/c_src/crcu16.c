typedef unsigned short u16;
typedef unsigned char u8;
u16 crcu8(u8 data, u16 crc);
u16 crcu16(u16 newval, u16 crc) {
  crc = crcu8((u8)(newval), crc);
  crc = crcu8((u8)((newval) >> 8), crc);
  return crc;
}