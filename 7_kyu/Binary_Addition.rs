// Returns a + b as binary number.
fn add_binary(a: u64, b: u64) -> String {
    format!("{:b}", a + b)
}
