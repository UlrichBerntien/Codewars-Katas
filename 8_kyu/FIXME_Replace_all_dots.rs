use lazy_static::lazy_static;
use regex::Regex;

// Returns string s with all dots (.) replaced by dashes (-).
fn replace_dots(s: &str) -> String {
    lazy_static! {
        static ref DOT: Regex = Regex::new(r"\.").unwrap();
    }
    DOT.replace_all(s, "-").to_string()
}
