// Returns the words in revers order.
// Words must be separated by whitespaces at input and by one space at return.
fn reverse_words(words: &str) -> String {
    let mut accu: String = String::with_capacity(words.len());
    for word in words.split_whitespace().rev() {
        if !accu.is_empty() {
            accu.push(' ');
        }
        accu.push_str(word);
    }
    accu
}
