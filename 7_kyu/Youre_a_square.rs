// Returns true if there is an integer k with k² == n.
fn is_square(n: i64) -> bool {
    if n < 0 {
        return false;
    }
    (n as f64).sqrt().fract() < 1e-12
}
