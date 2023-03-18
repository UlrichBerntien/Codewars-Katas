use lazy_static::lazy_static;
use std::collections::HashMap;

// Generates a map letter to index number (1 based) in the alphabet.
// Index numbers are stored as decimal numbers in strings.
fn generate_letter_index() -> HashMap<char, String> {
    let mut accu: HashMap<char, String> = HashMap::with_capacity(2 * 26);
    for letters in ['A'..='Z', 'a'..='z'] {
        for (i, c) in letters.enumerate() {
            accu.insert(c, (i + 1).to_string());
        }
    }
    accu
}

// Converts letters in the text to string of decimal numbers.
// The decimal numbers are the index (1 based) in the alphabet.
fn alphabet_position(text: &str) -> String {
    lazy_static! {
        static ref LETTER_TO_INDEX: HashMap<char, String> = generate_letter_index();
    }
    let mut accu = String::with_capacity(text.len() * 3);
    for c in text.chars() {
        if let Some(index) = LETTER_TO_INDEX.get(&c) {
            if !accu.is_empty() {
                accu.push(' ')
            };
            accu.push_str(index);
        }
    }
    accu
}
