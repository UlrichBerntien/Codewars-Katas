// Converts the binary representation into a number.
fn binary_slice_to_number(slice: &[u32]) -> u32 {
    slice.iter().fold(0u32, |accu, x| accu * 2 + x)
}
