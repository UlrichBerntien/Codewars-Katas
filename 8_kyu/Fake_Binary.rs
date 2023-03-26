// Converts the string to a fake binary string.
// Replaces all chars below '5' to '0' all other chars to '0'.
fn fake_bin(s: &str) -> String {
    s.chars().map(|c| if c < '5' { '0' } else { '1' }).collect()
}
