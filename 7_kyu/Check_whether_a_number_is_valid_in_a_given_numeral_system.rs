// Checks if num is a valid number with base.
// Argument base could be in range 2..=36.
fn validate_base(num: &str, base: u32) -> bool {
    if !(2..=36).contains(&base) {
        panic!()
    }
    let range_digits = '0'..char::from_u32('0' as u32 + u32::min(10, base)).unwrap();
    let range_letters = 'A'..char::from_u32('A' as u32 + u32::max(10, base) - 10).unwrap();
    num.chars()
        .all(|c| range_digits.contains(&c) || range_letters.contains(&c))
}
