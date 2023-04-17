// Removes all words with exactly one exclamation mark.
// Also removes the spaces before the word.
// Words are separated by one ore more whites spaces. All other characters are treated as part of a word.
// For example, letters, digits, and characters like '.' are part of a word.
fn remove(s: &str) -> String {
    // Process the input string char by char.
    let source: Vec<char> = s.chars().collect();
    let n = source.len();
    // Allocate maximal possible buffer to speed up
    let mut dest: String = String::with_capacity(n);
    // start is index of current word with separator chars before.
    let mut start: usize = 0;
    while start < n {
        let mut i = start;
        let mut ex_counter: usize = 0;
        while i < n && source[i].is_whitespace() {
            // include the separators
            i += 1;
        }
        if dest.is_empty() {
            // Suppress separator characters at start of the result string.
            start = i;
        }
        while i < n && !source[i].is_whitespace() {
            // include all word characters
            if source[i] == '!' {
                // count the exclamation marks
                ex_counter += 1;
            }
            i += 1;
        }
        if ex_counter != 1 {
            // Add all words with separators before, if not exact one '!' is included.
            dest.extend(&source[start..i]);
        }
        start = i;
    }
    dest
}
