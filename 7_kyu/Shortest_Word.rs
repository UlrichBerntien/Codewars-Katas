// Length of string in character units.
fn char_length(s: &str) -> usize {
    s.chars().count()
}

// Returns length of shortes word in s.
// Words are separated by whitespaces (no punctuation marks.)
// Length is calculated in character units, not in bytes.
fn find_short(s: &str) -> u32 {
    s.split_whitespace().map(char_length).min().unwrap_or(0) as u32
}
