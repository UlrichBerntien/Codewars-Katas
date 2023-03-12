// Returns the string s capitalized.
// First(s) character(s) is the uppercase letter(s) of s[0], the rest are lowercase.
fn capitalize(s: &str) -> String {
    let mut source = s.chars();
    // String size of the result is around the input string size.
    let mut dest = String::with_capacity(s.len());
    // First character to upper case (could generate more than one character!)
    if let Some(first) = source.next() {
        dest.extend(first.to_uppercase())
    }
    // Remaining part of the string in lower case letters.
    for remain in source {
        dest.extend(remain.to_lowercase())
    }
    dest
}

// Returns greating message for name.
fn greet(name: &str) -> String {
    format!("Hello {}!", capitalize(name))
}
