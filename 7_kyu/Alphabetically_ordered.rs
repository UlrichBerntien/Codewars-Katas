// Checks if characters in string s are sorted.
fn alphabetic(s: &str) -> bool {
    let mut chars = s.chars();
    // Set last_char to '0' if string is empty.
    // It's ok because the char will be never used.
    let mut last_char: char = chars.next().unwrap_or('0');
    // Attention: the loop starts at the second char of s.
    for c in chars {
        if c < last_char {
            // Quick exit if string is unsorted
            return false;
        }
        last_char = c;
    }
    // All chars in the string s are checked.
    // The string is sorted.
    true
}
