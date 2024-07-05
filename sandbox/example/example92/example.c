int chroma_sub_implemented(int mode)
{
  switch (mode) {
  case 0:
  case 1:
  case 3:
    return 1;
  case 2:
  case 4:
  case 5:
  case 7:
  case 6:
  default:
    return 0;
  }
}