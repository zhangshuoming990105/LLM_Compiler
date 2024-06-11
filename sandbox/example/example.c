int fib(int n) {
    if (n <= 1) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}



// int main() {
//     int x = 0;
//     int Array[10];
//     for (int i = 0; i < 10; i++) {
//         Array[i] = i;
//     }
//     int sum;
//     double avg;
//     for (int i = 0; i < 10; i++) {
//         sum += Array[i];
//     }
//     avg = sum / 10.0;
//     return 0;
// }