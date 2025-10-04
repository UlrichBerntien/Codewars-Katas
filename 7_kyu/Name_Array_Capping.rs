// Capitalizes all words in the argument array.
fn cap_me(arr: Vec<String>) -> Vec<String> {
    arr.iter().map(|s| capitalize(s)).collect()
}

// Capitalizes the words in the argument string.
// Returns each word with first char uppercase and the other chars lowercase.
fn capitalize(s: &str) -> String {
    let mut is_first = true;
    s.chars()
        .map(|c| {
            let result = if is_first {
                c.to_uppercase().collect::<String>()
            } else {
                c.to_lowercase().collect::<String>()
            };
            is_first = c.is_whitespace();
            result
        })
        .collect()
}
