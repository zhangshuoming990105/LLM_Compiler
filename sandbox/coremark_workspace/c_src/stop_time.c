#include <time.h>
extern struct timespec start_time_val, stop_time_val;
void stop_time(void) { clock_gettime(CLOCK_REALTIME, &stop_time_val); }