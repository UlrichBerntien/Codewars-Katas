/// Returns absolute value of n with negative sign.
///
/// The function returns n if n is less or equal 0.
/// The function returns -n if n is a positive number.
fn make_negative(n: i32) -> i32 {
    if n > 0 {-n} else {n}
}
