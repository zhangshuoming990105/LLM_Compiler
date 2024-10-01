
double InterpCubeLagrange(double xdiff, double ydiff, double zdiff,
        double vval000, double vval001, double vval010, double vval011,
        double vval100, double vval101, double vval110, double vval111) {

    double value;
    double oneMinusXdiff;
    double oneMinusYdiff;
    double oneMinusZdiff;

    oneMinusXdiff = 1.0 - xdiff;
    oneMinusYdiff = 1.0 - ydiff;
    oneMinusZdiff = 1.0 - zdiff;

    value = vval000 * (oneMinusXdiff) * (oneMinusYdiff) * (oneMinusZdiff)
            + vval001 * (oneMinusXdiff) * (oneMinusYdiff) * zdiff
            + vval010 * (oneMinusXdiff) * ydiff * (oneMinusZdiff)
            + vval011 * (oneMinusXdiff) * ydiff * zdiff
            + vval100 * xdiff * (oneMinusYdiff) * (oneMinusZdiff)
            + vval101 * xdiff * (oneMinusYdiff) * zdiff
            + vval110 * xdiff * ydiff * (oneMinusZdiff)
            + vval111 * xdiff * ydiff * zdiff;

    return (value);

}