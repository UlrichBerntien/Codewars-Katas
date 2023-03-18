// Mumbles the input string.
// e.g. accum("abcd") -> "A-Bb-Ccc-Dddd"
fn accum(s: &str) -> String {
    s.chars()
        .enumerate()
        .map(|(i, c)| mumble(i + 1, c))
        .collect::<Vec<String>>()
        .join("-")
}

// Form string by repeat characater c n times.
// First character is uppercase, rest is lowercase.
// If upper/lower case of the character is more than 1 char, the returned string is longer than n.
fn mumble(n: usize, c: char) -> String {
    let mut accu: String = String::with_capacity(n);
    let upper: String = c.to_uppercase().collect();
    let lower: String = c.to_lowercase().collect();
    if n > 0 {
        accu.push_str(&upper)
    }
    for _ in 1..n {
        accu.push_str(&lower)
    }
    accu
}
