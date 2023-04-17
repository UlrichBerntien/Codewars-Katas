// Returns all version of s with rotated characters.
fn rotate(s: &str) -> Vec<String> {
    // Extract the chars (not the bytes) from the string.
    // 2*len is upper limit of the number of chars in the string.
    let mut combined: Vec<char> = Vec::with_capacity(2 * s.len());
    combined.extend(s.chars());
    // Number of characters in the string.
    let n = combined.len();
    combined.extend_from_within(..);
    // Cut the rotated strings from the doubled string.
    // Start with string rotated by 1 char, stop with original string.
    (1..=n)
        .map(|i| String::from_iter(combined[i..i + n].iter()))
        .collect()
}
