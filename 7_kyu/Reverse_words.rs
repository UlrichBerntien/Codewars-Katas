// Retuns str with all word reversed.
// Here words are sequences of no-whitespace characters.
fn reverse_words(str: &str) -> String {
    // prepare result buffer
    let mut result: String = String::with_capacity(str.len());
    // iterate over the input string
    let mut it = str.chars();
    let mut peek = it.next();
    while peek.is_some() {
        // Copy word reversd into result buffer
        let mut word: String = String::new();
        while peek.is_some() && !peek.unwrap().is_whitespace() {
            word.push(peek.unwrap());
            peek = it.next();
        }
        for w in word.chars().rev() {
            result.push(w);
        }
        // Copy white space direct to result buffer
        while peek.is_some() && peek.unwrap().is_whitespace() {
            result.push(peek.unwrap());
            peek = it.next();
        }
    }
    result
}
