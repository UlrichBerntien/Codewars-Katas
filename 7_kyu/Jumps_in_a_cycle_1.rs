// Returns minimal count of jumps to reach element index 0 again.
fn get_jumps(cycle: Vec<i32>, k: i32) -> i32 {
    let cl = cycle.len() as i64;
    (cl / greatest_common_divisor(cl, k as i64)) as i32
}

// Greatest common divisor of a and b.
fn greatest_common_divisor(a: i64, b: i64) -> i64 {
    let mut a = a.abs();
    let mut b = b.abs();
    while b != 0 {
        (b, a) = (a % b, b);
    }
    a
}
