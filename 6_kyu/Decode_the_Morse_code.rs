mod preloaded;
use preloaded::MORSE_CODE;

use lazy_static::lazy_static;
use regex::Regex;

fn decode_morse_char(word: &str) -> &'static str {
    const SPACE: &str = " ";
    match MORSE_CODE.get(word) {
        Some(c) => c,
        None => SPACE,
    }
}

fn decode_morse(encoded: &str) -> String {
    lazy_static! {
        static ref MORSE: Regex = Regex::new(r"[.-]+|\s{2,}").unwrap();
    }
    let mut accu: String = String::with_capacity(encoded.len() / 3);
    for cap in MORSE.captures_iter(encoded.trim()) {
        accu.push_str(decode_morse_char(&cap[0]));
    }
    accu
}
