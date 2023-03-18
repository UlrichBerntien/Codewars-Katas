use std::collections::HashMap;

// Counts the number of duplicate characters in the text.
// Uses case-insensitive comparisons.
fn count_duplicates(text: &str) -> u32 {
    // Number of repetitions (=count-1) per character.
    let mut repeats: HashMap<String, usize> = HashMap::new();
    // Inspect all characters of the text.
    for c in text.chars() {
        // One UTF-8 character may result in more than one character if case changed.
        let key: String = c.to_lowercase().collect();
        repeats.entry(key).and_modify(|rep| *rep += 1).or_insert(0);
    }
    // Count of the number of duplicates = number of elements with repeats.
    // Return u32 as specified, with overflow error risk.
    repeats.values().filter(|&&rep| rep > 0).count() as u32
}
