fn tidy_number(n: u64) -> bool {
    let mut remainder = n;
    let mut last_digit = 10;
    while remainder > 0 {
        let digit = remainder % 10;
        if digit > last_digit {
            // invalid digit order for a tidy number.
            return false;
        }
        last_digit = digit;
        remainder /= 10;
    }
    // All digits are checked, the number is tidy.
    true
}
