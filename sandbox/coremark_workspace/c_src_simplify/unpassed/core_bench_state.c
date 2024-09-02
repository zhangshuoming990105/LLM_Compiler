typedef unsigned short u16;
typedef unsigned char u8;
typedef enum CORE_STATE {
  CORE_START = 0,
  CORE_INVALID,
  CORE_S1,
  CORE_S2,
  CORE_INT,
  CORE_FLOAT,
  CORE_EXPONENT,
  CORE_SCIENTIFIC,
  NUM_CORE_STATES
} core_state_e;

u16 crcu32(unsigned newval, u16 crc);
enum CORE_STATE core_state_transition(u8 **instr, unsigned *transition_count);

u16 core_bench_state(unsigned blksize, u8 *memblock, short seed1, short seed2,
                     short step, u16 crc) {
  unsigned final_counts[NUM_CORE_STATES];
  unsigned track_counts[NUM_CORE_STATES];
  u8 *p = memblock;
  unsigned i;

  for (i = 0; i < NUM_CORE_STATES; i++) {
    final_counts[i] = track_counts[i] = 0;
  }
  while (*p != 0) {
    enum CORE_STATE fstate = core_state_transition(&p, track_counts);
    final_counts[fstate]++;
  }
  p = memblock;
  while (p < (memblock + blksize)) {
    if (*p != ',')
      *p ^= (u8)seed1;
    p += step;
  }
  p = memblock;
  while (*p != 0) {
    enum CORE_STATE fstate = core_state_transition(&p, track_counts);
    final_counts[fstate]++;
  }
  p = memblock;
  while (p < (memblock +
              blksize)) {
    if (*p != ',')
      *p ^= (u8)seed2;
    p += step;
  }
  for (i = 0; i < NUM_CORE_STATES; i++) {
    crc = crcu32(final_counts[i], crc);
    crc = crcu32(track_counts[i], crc);
  }
  return crc;
}