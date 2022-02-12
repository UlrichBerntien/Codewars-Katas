use lazy_static::lazy_static;
use regex::Regex;
use std::collections::HashSet;

fn shifter(s: &str) -> usize {
    lazy_static! {
        static ref shifter_pattern: Regex = Regex::new(r"\b[HINOSXZMW]+\b").unwrap();
    }
    let mut shifters = HashSet::new();
    for it in shifter_pattern.find_iter(s) {
        shifters.insert(it.as_str());
    }
    shifters.len()
}