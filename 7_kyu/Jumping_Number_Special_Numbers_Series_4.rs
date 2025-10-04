// Checks if number is a jumping number.
// Jumping means distance between all adjacent decimal digits is 1.
fn jumping_number(n: u64) -> String {
    // Split number into value of last digit and value of leading digits
    let mut last_digit = n % 10;
    let mut leading = n / 10;
    // Process digit by digit
    while leading > 0 {
        let digit = leading % 10;
        if last_digit + 1 != digit && digit + 1 != last_digit {
            return "Not!!".to_string();
        }
        last_digit = digit;
        leading /= 10;
    }
    "Jumping!!".to_string()
}
