typedef unsigned short u16;
typedef unsigned char u8;

typedef struct CORE_PORTABLE_S {
  u8 portable_id;
} core_portable;
typedef struct list_data_s {
  short data16;
  short idx;
} list_data;

typedef struct list_head_s {
  struct list_head_s *next;
  struct list_data_s *info;
} list_head;

typedef struct MAT_PARAMS_S {
  int N;
  short *A;
  short *B;
  int *C;
} mat_params;

typedef struct RESULTS_S {
  short seed1;
  short seed2;
  short seed3;
  void *memblock[4];
  unsigned size;
  unsigned iterations;
  unsigned execs;
  struct list_head_s *list;
  mat_params mat;
  u16 crc;
  u16 crclist;
  u16 crcmatrix;
  u16 crcstate;
  short err;
  core_portable port;
} core_results;

u16 crcu16(u16 newval, u16 crc);
u16 core_bench_state(unsigned blksize, u8 *memblock, short seed1, short seed2,
                     short step, u16 crc);
u16 core_bench_matrix(mat_params *p, short seed, u16 crc);

short calc_func(short *pdata, core_results *res) {
  short data = *pdata;
  short retval;
  u8 optype = (data >> 7) & 1;
  if (optype)
    return (data & 0x007f);
  else {
    short flag = data & 0x7;
    short dtype = ((data >> 3) & 0xf);
    dtype |= dtype << 4;
    switch (flag) {
    case 0:
      if (dtype < 0x22)
        dtype = 0x22;
      retval = core_bench_state(res->size, res->memblock[3], res->seed1,
                                res->seed2, dtype, res->crc);
      if (res->crcstate == 0)
        res->crcstate = retval;
      break;
    case 1:
      retval = core_bench_matrix(&(res->mat), dtype, res->crc);
      if (res->crcmatrix == 0)
        res->crcmatrix = retval;
      break;
    default:
      retval = data;
      break;
    }
    res->crc = crcu16(retval, res->crc);
    retval &= 0x007f;
    *pdata = (data & 0xff00) | 0x0080 | retval;
    return retval;
  }
}