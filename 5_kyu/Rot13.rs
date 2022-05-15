fn rot13_char(c: char) -> char {
    match c {
        'A'..='Z' => (b'A' + (c as u8 - b'A' + 13) % 26) as char,
        'a'..='z' => (b'a' + (c as u8 - b'a' + 13) % 26) as char,
        _ => c,
    }
}

fn rot13(message: &str) -> String {
    message.chars().map(rot13_char).collect()
}
