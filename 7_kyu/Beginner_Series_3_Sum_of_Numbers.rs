// Returns sum all numbers between a and b (including a and b).
fn get_sum(a: i64, b: i64) -> i64 {
    // Gauss sum formula
    (a + b) * ((a - b).abs() + 1) / 2
}
