mod preloaded;
use preloaded::NATO;

fn char_to_nato(c: char) -> &'static str {
    match c {
        'A'..='Z' => NATO[&c],
        'a'..='z' => NATO[&c.to_ascii_uppercase()],
        ',' => ",",
        '.' => ".",
        '!' => "!",
        '?' => "?",
        _ => "",
    }
}

fn to_nato(words: &str) -> String {
    let mut accu = String::with_capacity(words.len() * 5);
    accu.extend(
        words
            .chars()
            .map(char_to_nato)
            .filter(|s| s.len() > 0)
            .map(|s| format!("{} ", s)),
    );
    accu.truncate(accu.trim_end().len());
    accu
}
