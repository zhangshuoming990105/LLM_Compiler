int quant(int x, int y) {
    int temp, quotient, remainder;

    // Take absolute value of x
    temp = (x < 0) ? -x : x;

    // Perform division and get remainder
    quotient = temp / y;
    remainder = temp - (quotient * y);

    // Check if y is negative, if so, use its positive value
    int y_abs = (y < 0) ? y + 1 : y;

    // Round up if remainder is greater than y_abs/2
    if (remainder > (y_abs >> 1)) {
        quotient++;
    }

    // Multiply rounded quotient by y
    temp = quotient * y;

    // Restore the sign if x was negative
    return (x < 0) ? -temp : temp;
}