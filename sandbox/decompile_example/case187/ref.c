#include <stdio.h>	//FILE*

#include <time.h>	//clock_t, clock()

double TLAString_toDouble(const char* string){
 const char sign= (*string);
 double value = 0;
 if(sign=='-' || sign=='+') string++;

 while((*string)!='\0' && (*string)!='.'){
  value = (value * 10.0f) + ((*string) - 48.0f);
  string++;
 }

 if((*string)=='.'){
  float factorDivisor = 10.0f;
  string++;
  while((*string)!='\0'){
   value += (((*string) - 48.0f) / factorDivisor);
   factorDivisor *= 10.0f;
   string++;
  }
 }

 if(sign=='-') value = -value;

 return value;
}