extern int printf(const char *, ...);
int main() {
    int A[10];
    for(int i = 0; i < 10; i++) {
        A[i] = i;
        printf("%d\n", A[i]);
    }
    return 0;
}