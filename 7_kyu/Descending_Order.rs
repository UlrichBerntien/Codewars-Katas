// Returns the maximum number that has the same decimal digits as x.
fn descending_order(x: u64) -> u64 {
    const BASE: usize = 10;
    // Stores all digits sorted in map value -> count.
    let mut digits: [u64; BASE] = [0; BASE];
    // Split number into the decimal digits
    let mut remain = x as usize;
    while remain > 0 {
        digits[remain % BASE] += 1;
        remain /= BASE;
    }
    // Build up new number with maximal value of the digits
    let mut accu: usize = 0;
    for value in (0..BASE).rev() {
        for _ in 0..digits[value] {
            accu = accu * BASE + value;
        }
    }
    accu as u64
}
