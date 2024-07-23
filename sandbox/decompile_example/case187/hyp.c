double TLAString_toDouble(const char* str) {
    int sign = 1;
    double result = 0.0;
    int c = *str;
    int diff = c - 43;
    if (diff != 0) {
        c = *(str + 1);
        str++;
    }

    if (c != 0 && c != 46) {
        const double pow10 = 10.0;
        const float pow10_inv = 0.1;
        while (c != 0 && c != 46) {
            result = result * pow10 + (c - '0');
            c = *(++str);
        }
        if (c == 46) {
            double pow = 1.0;
            c = *(++str);
            while (c != 0) {
                pow *= pow10_inv;
                result += (c - '0') * pow;
                c = *(++str);
            }
        }
    }

    if (diff == 0) {
        sign = -1;
        result = -result;
    }

    return result;
}