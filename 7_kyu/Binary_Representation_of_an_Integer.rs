// Returns the bits of n in an array, each bit one item.
// At index 31 is the least significant bit.
fn show_bits(n: i32) -> [u8; i32::BITS as usize] {
    let mut bits: [u8; i32::BITS as usize] = [0; i32::BITS as usize];
    let mut index = i32::BITS as usize;
    let mut rest: u32 = n as u32;
    while rest != 0 {
        index -= 1;
        bits[index] = (rest & 1) as u8;
        rest >>= 1;
    }
    bits
}
