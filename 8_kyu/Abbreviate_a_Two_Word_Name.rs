fn abbrev_name(name: &str) -> String {
    let mut short = String::with_capacity(3);
    // Parse the string char by char, multi-byte-character safe.
    let mut name_chars = name.chars();
    // First letter if exists.
    if let Some(c) = name_chars.next() {
        short.push(c);
    }
    short.push('.');
    // Skip rest of first name.
    loop {
        match name_chars.next() {
            Some(c) if c.is_whitespace() => break,
            Some(_) => {}
            None => break,
        }
    }
    // Take first letter after the spaces if exists.
    loop {
        match name_chars.next() {
            Some(c) if c.is_whitespace() => {}
            Some(c) => {
                short.push(c);
                break;
            }
            None => break,
        }
    }
    // Abbreviation into uppercase.
    short.to_uppercase()
}
