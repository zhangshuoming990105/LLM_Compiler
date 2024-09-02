#include <time.h>
extern struct timespec start_time_val, stop_time_val;
void start_time(void) { clock_gettime(CLOCK_REALTIME, &start_time_val); }