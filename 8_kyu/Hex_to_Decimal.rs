// Parses hex number from string.
// Returns 0 if the number is invalid.
fn hex_to_dec(hex_string: &str) -> u32 {
    u32::from_str_radix(hex_string, 16).unwrap_or(0)
}

