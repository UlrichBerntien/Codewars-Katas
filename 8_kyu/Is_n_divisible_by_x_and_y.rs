// Returns true if n is divisible by x and by y.
fn is_divisible(n: i32, x: i32, y: i32) -> bool {
    n % x == 0 && n % y == 0
}