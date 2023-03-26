// Checks whether num is a decimal Narcissistic Number.
fn narcissistic(num: u64) -> bool {
    // maximal number of decimal digits of a u64 number.
    const MAX_DIGITS: usize = 20;
    assert!((u64::MAX as u128) < (10_u128).pow(MAX_DIGITS as u32));
    // store digits on the stack, no heap allocation required
    let mut digits: [u64; MAX_DIGITS] = [0; MAX_DIGITS];
    // divide num into decimal digits and determine the number of digits:
    let mut n_digits: usize = 0;
    let mut remain = num;
    while remain > 0 {
        digits[n_digits] = remain % 10;
        remain /= 10;
        n_digits += 1;
    }
    // the number of digits is now fixed
    let n_digits = n_digits;
    // make sure that there is no overflow: Replace sum of all digits^n by stepwise subtraction
    remain = num;
    for digit in digits.iter().take(n_digits) {
        let x = digit.pow(n_digits as u32);
        if x > remain {
            return false;
        };
        remain -= x;
    }
    remain == 0
}
