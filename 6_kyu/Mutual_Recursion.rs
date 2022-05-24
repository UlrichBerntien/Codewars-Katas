fn f(n: i32) -> i32 {
    if n <= 0 {
        1
    } else {
        n - m(f(n - 1))
    }
}

fn m(n: i32) -> i32 {
    if n <= 0 {
        0
    } else {
        n - f(m(n - 1))
    }
}
