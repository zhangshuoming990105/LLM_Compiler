int quant(int x, int y) {
    int sign = 0;
    
    // Handle negative input
    if (x < 0) {
        sign = 1;
        x = -x;
    }
    
    // Perform division
    int result = x / y;
    
    // Round to nearest
    if (x % y > y / 2) {
        result++;
    }
    
    // Multiply back by y
    result *= y;
    
    // Restore sign if input was negative
    if (sign) {
        result = -result;
    }
    
    return result;
}