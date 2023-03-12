use lazy_static::lazy_static;
use regex::Regex;

// Returns the first capture reversed.
fn reverse_match(caps: &regex::Captures) -> String {
    caps[0].chars().rev().collect()
}

// Returns the words with all words with 5 or more characters reversed.
fn spin_words(words: &str) -> String {
    lazy_static! {
        static ref FIVE_AND_MORE: Regex = Regex::new(r"\S{5,}").unwrap();
    }
    FIVE_AND_MORE.replace_all(words, reverse_match).to_string()
}
