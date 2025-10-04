// Checks if text contains 1 and 0 sequence of same length.
// e.g. 110010 => true, 1100010 => false, 001101 => false
fn same_length(txt: &str) -> bool {
    const ZERO: u8 = b'0';
    const ONE: u8 = b'1';
    let mut state = ONE;
    let mut sub_length: usize = 0;
    for b in txt.bytes() {
        match state {
            ONE if b == ZERO && sub_length > 0 => state = ZERO,
            ZERO if b == ONE && sub_length == 0 => state = ONE,
            _ => (),
        }
        match state {
            ONE if b == ONE => sub_length += 1,
            ZERO if b == ZERO && sub_length > 0 => sub_length -= 1,
            _ => return false,
        }
    }
    sub_length == 0
}
