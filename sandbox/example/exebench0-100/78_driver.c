#include <stdio.h>

#include <string.h>

#include <stdlib.h>

#include <stdint.h>

#include <math.h>

int cat_nums(char *str_out, char *str);
int main() {
    char *str_out = "Output:";
    char *str[10] = {"123aaa", "fx2345", "123-4", "5zjje", "hello", "world12", "exe78", "bench", "0-100", "78"};
    for (int i = 0; i < 10; i++) {
        int res=cat_nums(str_out, str[i]);
        printf("%d = cat_nums(%s, %s)\n", res, str_out, str[i]);
    }
    return 0;
}