// Returns s splited by whitespaces in format "string len".
// len is the number of bytes in the string as decimal number.
fn add_length(s: &str) -> Vec<String> {
    s.split_whitespace()
        .map(|it| format!("{} {}", it, it.len()))
        .collect()
}
