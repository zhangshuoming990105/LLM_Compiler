#include <stdio.h>
unsigned int CgosStrLen(const char *s);
int main() {
    char *strs[10] = {"", "a", "ab", "abc", "abcd", "abcde", "abcdef", "abcdefg", "abcdefgh", "abcdefghi"};
    int i;
    for (i = 0; i < 10; i++) {
        printf("%d\n", CgosStrLen(strs[i]));
    }
    return 0;
}