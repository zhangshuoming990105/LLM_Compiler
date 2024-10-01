#include <time.h>

#include <stdint.h>

#include <string.h>

#include <math.h>

int qcs_numbase_d2int(char t)
{
    if(t>='0' && t<='9') return t-'0';
    if(t>='a' && t<='z') return t-'a'+10;
    if(t>='A' && t<='Z') return t-'A'+10;

}