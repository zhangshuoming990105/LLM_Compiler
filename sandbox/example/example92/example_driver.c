#include <stdio.h>
int chroma_sub_implemented(int mode);
int main() {
    int mode[10] = {0,1,2,3,4,5,6,7,8,9};
    for(int i = 0; i < 10; i++) {
        int res = chroma_sub_implemented(mode[i]);
        printf("%d: chroma_sub_implemented(%d)=%d\n", i, mode[i], res);
    }
    return 0;
}