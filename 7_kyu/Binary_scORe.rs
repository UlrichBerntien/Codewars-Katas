// Returns the "Binary scORe".
fn score(n: u32) -> u32 {
    // Set of 0 bit in n blow the first 1 also to 1.
    match n {
        0 | u32::MAX => n,
        _ => u32::MAX >> n.leading_zeros(),
    }
}
