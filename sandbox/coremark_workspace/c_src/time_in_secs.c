#include <time.h>
double time_in_secs(clock_t ticks) {
  double retval = ((double)ticks) / (double)1000;
  return retval;
}