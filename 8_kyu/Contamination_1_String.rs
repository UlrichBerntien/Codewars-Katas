// Retuns string of length text filled with character.
fn contamination(text: &str, character: &str) -> String {
    // character must be a string contaning 1 character.
    if character.chars().count() != 1 {
        return String::new()
    }
    // Calculate number of chars, 
    let n = text.chars().count();
    // Return string with same number of chars as text.
    character.repeat(n)
}
