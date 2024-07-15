#include <math.h>
#include <stdbool.h>

/**
 * Check if in given list of numbers, are any two numbers closer to each other
 * than given threshold.
 *
 * bool has_close_elements(float numbers[], int size, float threshold);
 */

bool has_close_elements(float numbers[], int size, float threshold) {
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      if (i != j) {
        float distance = fabs(numbers[i] - numbers[j]);
        if (distance < threshold) {
          return true;
        }
      }
    }
  }
  return false;
}