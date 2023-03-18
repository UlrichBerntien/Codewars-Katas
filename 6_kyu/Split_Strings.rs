// Splits s into strings of 2 characters.
// Appends '_' if needed.
fn solution(s: &str) -> Vec<String> {
    // Split s into characters (not into bytes).
    let a: Vec<char> = s.chars().collect();
    // Form string of 2 characters
    let mut accu: Vec<String> = Vec::with_capacity((a.len() + 1) / 2);
    for c in a.chunks_exact(2) {
        accu.push(format!("{}{}", c[0], c[1]))
    }
    // optional last character with a "_"
    if a.len() & 1 == 1 {
        accu.push(format!("{}_", a[a.len() - 1]))
    }
    accu
}
