#include <stdio.h>

#include <stdlib.h>

#include <string.h>

#include <ctype.h>
// int isspec(char c) {
//   return (((c >= '!') && (c <= '/')) || (c >= ':' && c <= '@') ||
//           ((c >= '[') && (c <= '`')) || ((c >= '{') && (c <= 'DEL')));
// }
int isspec(char c);
int main() {
    char c[10] = {'!', '@', 'DEL', '`', '{', 'a', 'z', 'A', 'Z', '0'};
    for (int i = 0; i < 10; i++) {
        printf("%c: %d\n", c[i], isspec(c[i]));
    }
    return 0;
}