// Returns value of number n written in base b and reversed.
// eg. value 12 base 10 -> "12" -> "21" -> value 21.
fn reversed_number(n: u32, b: u32) -> u64 {
    if b < 2 {
        return n as u64;
    }
    let mut input = n;
    let mut reverse = 0u64;
    while input > 0 {
        reverse = reverse * b as u64 + (input % b) as u64;
        input /= b;
    }
    reverse
}
