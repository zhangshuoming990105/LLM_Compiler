#include <time.h>

extern struct timespec start_time_val, stop_time_val;

clock_t get_time(void) {
  clock_t elapsed =
      ((stop_time_val.tv_sec - start_time_val.tv_sec) * 1000 +
       (stop_time_val.tv_nsec - start_time_val.tv_nsec) / 1000000);
  return elapsed;
}