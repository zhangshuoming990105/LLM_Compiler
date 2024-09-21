class MyStruct1:
    def __init__(self, f1, i1):
        self.f1 = f1
        self.i1 = i1

class MyStruct2:
    def __init__(self, s1, i2, d1, d2, s2):
        self.s1 = s1
        self.i2 = i2
        self.d1 = d1
        self.d2 = d2
        self.s2 = s2

arr1 = [[0 for _ in range(10)] for _ in range(10)]

def longfunction1(res):
    # initialize 1
    for i in range(10):
        for j in range(10):
            arr1[i][j] = 0

    # op1
    for _ in range(5):  # Repeat the block 5 times as in the original code
        for i in range(10):
            for j in range(10):
                for k in range(res.i2):
                    arr1[i][j] += res.s1.i1

        # op2
        for i in range(10):
            for j in range(10):
                arr1[i][j] += res.s2.i1

        # op3
        for i in range(10):
            for j in range(10):
                arr1[i][j] += int(res.d1 / res.d2)

    arr1[9][9] = 0  # needle

def main():
    # unittest on longfunction1
    s1 = MyStruct1(1.0, 2)
    s2 = MyStruct1(3.0, 4)
    result_struct = MyStruct2(s1, 3, 18.0, 5.0, s2)
    longfunction1(result_struct)
    
    print(f"arr1[0][0] = {arr1[0][0]}")
    print(f"arr1[9][9] = {arr1[9][9]}")

if __name__ == "__main__":
    main()