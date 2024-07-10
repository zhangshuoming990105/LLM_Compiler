#include <stdio.h>
int retPosVector(char letra, char alfabeto[]);
int main() {
    char alfabeto[] = "abcdefghijklmnopqrstuvwxyz";
    char letra[10] = {'a', 'c', 'e', 'd', 'z', 'p', 'W', 'A', 'B', 'C'};
    int i;
    for (i = 0; i < 10; i++) {
        printf("%d\n", retPosVector(letra[i], alfabeto));
    }
    return 0;
}