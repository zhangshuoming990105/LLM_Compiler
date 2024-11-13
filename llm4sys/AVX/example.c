#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>

// vector add
void vec_add(float *a, float *b, float *c, int n) {
  for (int i = 0; i < n; i++) {
    c[i] = a[i] + b[i];
  }
}

// avx2 version
void vec_add_avx2(float *a, float *b, float *c, int n) {
  int i;
  for (i = 0; i < n - 7; i += 8) {
    __m256 a_vec = _mm256_loadu_ps(a + i);
    __m256 b_vec = _mm256_loadu_ps(b + i);
    __m256 c_vec = _mm256_add_ps(a_vec, b_vec);
    _mm256_storeu_ps(c + i, c_vec);
  }
  __asm__ volatile("nop\n\t");
  // remains
  for (; i < n; i++) {
    c[i] = a[i] + b[i];
  }
}