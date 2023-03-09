// Returns the middle character of the strings.
// Returns 1 or 2 character length string if s length is odd or even.
fn get_middle(s: &str) -> &str {
    // Convert string of UTF-8 bytes into an array of characters.
    let v: Vec<char> = s.chars().collect();
    let n = v.len();
    if n < 3 {
        return s;
    }
    // Calculate the byte positions in the UTF-8 string
    let prefix: String = v[0..(n - 1) / 2].iter().collect();
    let middle: String = v[(n - 1) / 2..(n + 2) / 2].iter().collect();
    // Return the middle part of the UTF-8 string, could be 1 byte up to 8 bytes.
    &s[prefix.len()..prefix.len() + middle.len()]
}
