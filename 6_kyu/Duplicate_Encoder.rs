use std::collections::HashMap;

// Returns a string with the character '(' to indicate a single character in the word, and ')' to indicate characters used twice.
// Function ignores upper/lower case. (Uses lower case transformation).
fn duplicate_encode(word:&str)->String {
    // Converts all to the same case.
    let word = String::from(word).to_lowercase();
    // Create mapping to the indication character.
    let mut mapping = HashMap::<char,char>::with_capacity(word.len());
    for c in word.chars() {
        if let Some(item) = mapping.get_mut(&c) {
            *item = ')';
        } else {
            mapping.insert(c, '(');
        }
    }
    // Changes all chars to the two indication chars. 
    word.chars().map(|c| mapping.get(&c).unwrap()).collect()
}
