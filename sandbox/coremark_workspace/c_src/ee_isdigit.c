typedef unsigned char u8;
u8 ee_isdigit(u8 c) {
  u8 retval;
  retval = ((c >= '0') & (c <= '9')) ? 1 : 0;
  return retval;
}