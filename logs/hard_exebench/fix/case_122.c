#include <stdio.h>

#include <string.h>

int vowel(char a[]) {
    int count=0;

    if(a == 'a' || a == 'A' || a == 'e' || a == 'E' || a == 'i' || a == 'I' || a == 'o' || a == 'O' || a == 'u' || a == 'U') {
        count++;
    }

    return count;
}