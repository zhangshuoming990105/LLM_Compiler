int big_endian(
    void)
{
    union {
        long l;
        char c[sizeof(long)];
    } u;

    u.l = 1;

    return (u.c[sizeof(long) - 1] == 1);
}