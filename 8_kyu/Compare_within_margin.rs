// Compares a and b.
// Returns 0 if a = b, -1 if a < b, +1 of b > a.
// Interprets equal with +/-margin.
fn close_compare(a: f64, b: f64, margin: f64) -> i8 {
    let delta = a - b;
    if margin < 0. {
        panic!("margin parameter negative")
    }
    if delta.abs() <= margin {
        0
    } else if delta < 0. {
        -1
    } else {
        1
    }
}
