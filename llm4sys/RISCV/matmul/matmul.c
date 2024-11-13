#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <x86intrin.h>

void matmul(int N, float A[N][N], float B[N][N], float C[N][N]) {
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      C[i][j] = 0;
      for (int k = 0; k < N; k++) {
        C[i][j] += A[i][k] * B[k][j];
      }
    }
  }
}

void matmul2(int N, float A[N][N], float B[N][N], float C[N][N]) {
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      __m256 c_vec = _mm256_setzero_ps();
      for (int k = 0; k < N; k += 8) {
        __m256 a_vec = _mm256_loadu_ps(&A[i][k]);
        __m256 b_vec =
            _mm256_set_ps(B[k + 7][j], B[k + 6][j], B[k + 5][j], B[k + 4][j],
                          B[k + 3][j], B[k + 2][j], B[k + 1][j], B[k][j]);
        __m256 mul_vec = _mm256_mul_ps(a_vec, b_vec);
        c_vec = _mm256_add_ps(c_vec, mul_vec);
      }
      float c_arr[8];
      _mm256_storeu_ps(c_arr, c_vec);
      C[i][j] = c_arr[0] + c_arr[1] + c_arr[2] + c_arr[3] + c_arr[4] +
                c_arr[5] + c_arr[6] + c_arr[7];
    }
  }
}

// implement a __asm__ volatile version, named matmul3, which directly called avx2 instructions
void matmul3(int N, float A[N][N], float B[N][N], float C[N][N]) {
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      __m256 c_vec = _mm256_setzero_ps();
      for (int k = 0; k < N; k += 8) {
        __m256 a_vec = _mm256_loadu_ps(&A[i][k]);
        __m256 b_vec = _mm256_set_ps(B[k + 7][j], B[k + 6][j], B[k + 5][j], B[k + 4][j],
                                     B[k + 3][j], B[k + 2][j], B[k + 1][j], B[k][j]);
        __m256 mul_vec;
        __asm__ volatile (
          "vmulps %1, %2, %0"
          : "=x" (mul_vec)
          : "x" (a_vec), "x" (b_vec)
        );
        __asm__ volatile (
          "vaddps %1, %2, %0"
          : "=x" (c_vec)
          : "x" (c_vec), "x" (mul_vec)
        );
      }
      float c_arr[8];
      _mm256_storeu_ps(c_arr, c_vec);
      C[i][j] = c_arr[0] + c_arr[1] + c_arr[2] + c_arr[3] + c_arr[4] +
                c_arr[5] + c_arr[6] + c_arr[7];
    }
  }
}

void matmul4(int N, float A[N][N], float B[N][N], float C[N][N]) {
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      float c_arr[8] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f};
      for (int k = 0; k < N; k += 8) {
        __asm__ volatile (
          "pajigtnuep\n\t" // you can write whatever you want here
        );
        // __asm__ volatile (
        //   "vmovaps %1, %%ymm0\n\t"  // Load A[i][k] into ymm0
        //   "vbroadcastss %2, %%ymm1\n\t"  // Load B[k][j] into ymm1
        //   "vmulps %%ymm1, %%ymm0, %%ymm0\n\t"  // Multiply ymm0 and ymm1
        //   "vaddps %0, %%ymm0, %%ymm0\n\t"  // Add to c_arr
        //   "vmovaps %%ymm0, %0\n\t"  // Store result back to c_arr
        //   : "+m" (c_arr)  // Output
        //   : "m" (A[i][k]), "m" (B[k][j])  // Inputs
        //   : "ymm0", "ymm1", "memory"  // Clobbers
        // );
      }
      C[i][j] = c_arr[0] + c_arr[1] + c_arr[2] + c_arr[3] + c_arr[4] +
                c_arr[5] + c_arr[6] + c_arr[7];
    }
  }
}



float randn() {
  // Using Box-Muller transform to generate a normally distributed random number
  float u1 = (float)rand() / RAND_MAX;
  float u2 = (float)rand() / RAND_MAX;
  float z0 = sqrt(-2.0f * log(u1)) * cos(2.0f * M_PI * u2);
  return z0;
}

// Example usage
int main() {
  int N_values[] = {32, 64, 128, 256, 512};
  for (int idx = 0; idx < 5; idx++) {
    int N = N_values[idx];
    float A[N][N], B[N][N], C1[N][N], C2[N][N];

    // Initialize matrices A and B with some values
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        A[i][j] = (float)(randn()) / sqrt(N);
        B[i][j] = (float)(randn()) / sqrt(N);
        if (A[i][j] < -4.0f) {
          A[i][j] = -4.0f;
        } else if (A[i][j] > 4.0f) {
          A[i][j] = 4.0f;
        }
        if (B[i][j] < -4.0f) {
          B[i][j] = -4.0f;
        } else if (B[i][j] > 4.0f) {
          B[i][j] = 4.0f;
        }
      }
    }

    // Compute matrix multiplication using matmul
    matmul3(N, A, B, C1);

    // Compute matrix multiplication using matmul2
    matmul4(N, A, B, C2);

    // Compare the results
    int correct = 1;
    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        if ((fabs(C1[i][j] - C2[i][j]) / fmax(fabs(C1[i][j]), fabs(C2[i][j])) > 1e-5) && 
            (fabs(C1[i][j] - C2[i][j]) > 1e-5)) {
          correct = 0;
          // print the value that is different
          printf("C1[%d][%d] = %f, C2[%d][%d] = %f\n", i, j, C1[i][j], i, j,
                 C2[i][j]);
          break;
        }
      }
      if (!correct)
        break;
    }
    printf("C1[0][0] = %f, C2[0][0] = %f\n", C1[0][0], C2[0][0]);
    if (correct) {
      printf("Results match for N = %d\n", N);
    } else {
      printf("Results do not match for N = %d\n", N);
    }
  }
  return 0;
}
