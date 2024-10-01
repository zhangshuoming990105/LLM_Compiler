#include <stdio.h>

#include <stdlib.h>

#include <string.h>

int duplisearch(int *A,int n,int target){
 int left=0,right=n-1;
 int tmp;
 if(n<2) return A[0]==target?0:-1;
 while(left<=right){
  tmp=(right+left)/2;
  if(A[tmp]==target) return tmp;

  if(A[tmp]>A[left]){
   if(A[tmp]>target&&A[left]<=target){
    right=tmp-1;
   }else left=tmp;
  }else if(A[tmp]<A[left]){
   if(A[tmp]<target&&target<=A[right]){
    left=tmp+1;

   }else right=tmp;
  }else left++;
 }
 return -1;
}