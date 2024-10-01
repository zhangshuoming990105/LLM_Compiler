#include <stdio.h>

#include <stdlib.h>

#include <math.h>

float median3(float yy,float kaa, float koo)
{
  float array[3]; float tmp;
  int i,j;

  array[0]=yy; array[1]=kaa; array[2]=koo;


  for(j=0;j<3-1;j++)
    for(i=0;i<3-1-j;i++){
      if(array[i]>array[i+1]) {
 tmp=array[i];
 array[i] = array[i+1];
 array[i+1]=tmp;
      }
    }
  return(array[1]);
}