unsigned int CgosStrLen(const char *s) {
  const char *ss = s;
  if (!s)
    return 0;
  while (*s++)
    ;
  return s - ss - 1;
}