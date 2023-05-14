// Returns 1 if any bit at index 0,2,4,6,.. is 1
// Else returns 0.
fn any_odd(x: u32) -> u8 {
    (x & 0xaaaa_aaaa > 0) as u8
}
