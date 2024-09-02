typedef unsigned short u16;
typedef unsigned char u8;
u16 crcu16(u16 newval, u16 crc);
u16 crc16(short newval, u16 crc) { return crcu16((u16)newval, crc); }