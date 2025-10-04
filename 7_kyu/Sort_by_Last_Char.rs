// Return all words of s sorted by last characater of the word.
// If last char is equal the first word in s comes firt.
fn sort_by_last_char(s: &str) -> Vec<String> {
    let mut splitted: Vec<String> = s.split(char::is_whitespace).map(str::to_string).collect();
    splitted.sort_by_cached_key(|s| s.chars().last());
    splitted
}
