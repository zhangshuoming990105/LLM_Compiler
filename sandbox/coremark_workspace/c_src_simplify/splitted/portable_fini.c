typedef unsigned char u8;

typedef struct CORE_PORTABLE_S {
  u8 portable_id;
} core_portable;
void portable_fini(core_portable *p) { p->portable_id = 0; }