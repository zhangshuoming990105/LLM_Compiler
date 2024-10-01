#include <math.h>

int FP_Cmp(float a_fp, float b_fp)
{
   unsigned long a, b;
   unsigned long as, ae, af, bs, be, bf;
   int gt;
   a = (*(unsigned long*)&(a_fp));
   b = (*(unsigned long*)&(b_fp));
   if(a == b)
      return 0;
   as = a >> 31;
   bs = b >> 31;
   if(as > bs)
      return -1;
   if(as < bs)
      return 1;
   gt = as ? -1 : 1;
   ae = (a >> 23) & 0xff;
   be = (b >> 23) & 0xff;
   if(ae > be)
      return gt;
   if(ae < be)
      return -gt;
   af = 0x00800000 | (a & 0x007fffff);
   bf = 0x00800000 | (b & 0x007fffff);
   if(af > bf)
      return gt;
   return -gt;
}