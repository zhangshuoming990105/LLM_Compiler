int quant(int n, int m)
{
    int i_0, neg_0;
    int temp0_0, temp1_0, temp2_0, temp3_0, temp4_0, temp5_0, temp6_0, temp7_0, temp8_0, temp9_0;
    int neg_1, n_0, i_1, i_2, i_3, i_4, i_5;

    neg_0 = 0;
    if (n < 0) {
        neg_1 = neg_0 + 1;
        temp0_0 = -n;
        n_0 = temp0_0;
    } else {
        neg_1 = neg_0;
        n_0 = n;
    }

    temp1_0 = n_0;
    temp2_0 = m;
    temp3_0 = temp1_0 / temp2_0;
    i_0 = temp3_0;

    temp4_0 = n_0;
    temp5_0 = m;
    temp6_0 = i_0;
    temp7_0 = temp5_0 * temp6_0;
    temp8_0 = temp4_0 - temp7_0;
    temp9_0 = temp5_0 / 2;
    if (temp8_0 > temp9_0) {
        i_1 = i_0 + 1;
    } else {
        i_1 = i_0;
    }

    temp0_0 = i_1;
    temp1_0 = m;
    temp2_0 = temp0_0 * temp1_0;
    i_2 = temp2_0;

    if (neg_1) {
        temp3_0 = -i_2;
        i_3 = temp3_0;
    } else {
        i_3 = i_2;
    }

    return i_3;
}
