// Returns True if the last ASCII char of body is tail.
fn correct_tail(body: &str, tail: char) -> bool {
    if body.is_empty() {
        return tail == '\0';
    }
    // Only 8-bit character allowed as last char in the body
    let b = body.as_bytes();
    b[b.len() - 1] as char == tail
}
