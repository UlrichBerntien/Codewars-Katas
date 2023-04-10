// Trims the string to the given length.
// Trims to total length if length > 3 or trims the unchanged part to given length length (1..3).
// Appends "..." if the returned string is cutted.
fn trim(phrase: &str, length: usize) -> String {
    // Convert stream of UTF-8 bytes into characters
    let mut accu: Vec<char> = phrase.chars().collect();
    if accu.len() > length {
        // length is the total length of the returned string or the length of the unchanged part.
        accu.truncate(if length <= 3 { length } else { length - 3 });
        // Add 3 dots to show that the string is cutted.
        accu.resize(accu.len() + 3, '.');
    }
    String::from_iter(accu.iter())
}
