// Returns String of character sequence.
// Argument is a string link "a-z", the start and end character separated by one hyphen.
fn gimme_the_letters(sp: &str) -> String {
    let start_separator_end: Vec<char> = sp.chars().collect();
    if start_separator_end.len() != 3 || start_separator_end[1] != '-' {
        panic!()
    }
    let start = char::min(start_separator_end[0], start_separator_end[2]);
    let end = char::max(start_separator_end[0], start_separator_end[2]);
    (start..=end).collect()
}
