use lazy_static::lazy_static;
use regex::Regex;

fn validate_pin(pin: &str) -> bool {
    lazy_static! {
        static ref PIN_REGEX: Regex = Regex::new(r"^(\d{4}|\d{6})$").unwrap();
    }
    PIN_REGEX.is_match(pin)
}
