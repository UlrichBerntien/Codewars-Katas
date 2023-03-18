use lazy_static::lazy_static;
use regex::Regex;

// Returns string x without spaces.
fn no_space(x: String) -> String {
    lazy_static! {
        static ref WHITESPACES: Regex = Regex::new(r"\s*").unwrap();
    }
    WHITESPACES.replace_all(&x, "").to_string()
}
