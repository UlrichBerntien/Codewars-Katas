#[macro_use]
extern crate lazy_static;

use regex::Regex;

fn testit(s: &str) -> usize {
    lazy_static! {
        static ref WORD_PATTERN: Regex = Regex::new("(?i)w[^o]*o[^r]*r[^d]*d").unwrap();
    }
    WORD_PATTERN.find_iter(s).count()
}
