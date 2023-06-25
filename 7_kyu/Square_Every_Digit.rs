// Returns number with all decimal digits squared.
fn square_digits(num: u64) -> u64 {
    // 1) Split num into digits
    let mut digits = [0u64; 21];
    debug_assert!(
        u64::MAX.to_string().len() < digits.len(),
        "digits buffer too small"
    );
    let mut n_digits: usize = 0;
    let mut remain = num;
    while remain > 0 {
        digits[n_digits] = remain % 10;
        remain /= 10;
        n_digits += 1;
    }
    // 2) combine squares of digits to result
    let mut accu: u64 = 0;
    while n_digits > 0 {
        n_digits -= 1;
        let x = digits[n_digits].pow(2);
        accu *= if x > 9 { 100 } else { 10 };
        accu += x;
    }
    accu
}
