use lazy_static::lazy_static;
use regex::Regex;

// Returns string without vowels.
fn disemvowel(s: &str) -> String {
    lazy_static! {
        static ref VOWELS :Regex = Regex::new(r"[aeiouAEIOU]+").unwrap();
    }
    VOWELS.replace_all(s,"").to_string()
}