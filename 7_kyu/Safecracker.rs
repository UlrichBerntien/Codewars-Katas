// Calculates position of the wheel.
// The wheel positions are 0..=99.
// The inc values are in -, +, - direction
fn safecracker(start: u8, incs: &(u16, u16, u16)) -> (u8, u8, u8) {
    // add 65600 to keep the value positive, it is 65600>-u16::MAX
    let a = (start as u32 + 65600 - incs.0 as u32) % 100;
    let b = (a + incs.1 as u32) % 100;
    let c = (b + 65600 - incs.2 as u32) % 100;
    (a as u8, b as u8, c as u8)
}
