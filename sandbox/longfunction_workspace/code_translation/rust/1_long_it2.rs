struct MyStruct1 {
    f1: f32,
    i1: i32,
}

struct MyStruct2<'a> {
    s1: &'a MyStruct1,
    i2: i32,
    d1: f64,
    d2: f64,
    s2: &'a MyStruct1,
}

fn longfunction1(res: &MyStruct2) {
    let mut arr1 = [[0; 10]; 10];

    // initialize 1
    for i in 0..10 {
        for j in 0..10 {
            arr1[i][j] = 0;
        }
    }

    // op1
    for i in 0..10 {
        for j in 0..10 {
            for _ in 0..res.i2 {
                arr1[i][j] += res.s1.i1;
            }
        }
    }

    // op2
    for i in 0..10 {
        for j in 0..10 {
            arr1[i][j] += res.s2.i1;
        }
    }

    // op3
    for i in 0..10 {
        for j in 0..10 {
            arr1[i][j] += (res.d1 / res.d2) as i32;
        }
    }

    // op1 again
    for i in 0..10 {
        for j in 0..10 {
            for _ in 0..res.i2 {
                arr1[i][j] += res.s1.i1;
            }
        }
    }

    // op2 again
    for i in 0..10 {
        for j in 0..10 {
            arr1[i][j] += res.s2.i1;
        }
    }

    // op3 again
    for i in 0..10 {
        for j in 0..10 {
            arr1[i][j] += (res.d1 / res.d2) as i32;
        }
    }

    println!("arr1[0][0] = {}", arr1[0][0]);
    println!("arr1[9][9] = {}", arr1[9][9]);
}

fn main() {
    let s1 = MyStruct1 { f1: 1.0, i1: 2 };
    let s2 = MyStruct1 { f1: 3.0, i1: 4 };
    
    let result_struct = MyStruct2 { s1: &s1, i2: 3, d1: 18.0, d2: 5.0, s2: &s2 };
    
    longfunction1(&result_struct);
}