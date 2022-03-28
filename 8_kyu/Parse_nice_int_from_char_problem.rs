fn get_age(age: &str) -> u32 {
    // Fast only ASCII charset solution.
    let bytes = age.as_bytes();
    if !bytes.is_empty() && b'0' <= bytes[0] && bytes[0] <= b'9' {
        (bytes[0] - b'0') as u32
    } else {
        // error fall back
        0
    }
}