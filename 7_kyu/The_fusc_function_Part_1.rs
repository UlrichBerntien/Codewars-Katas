// The fusc function as specified.
fn fusc(n: u32) -> u32 {
    match n {
        0 | 1 => n,
        _ if n & 1 == 0 => fusc(n / 2),
        _ => fusc(n / 2) + fusc(n / 2 + 1),
    }
}
