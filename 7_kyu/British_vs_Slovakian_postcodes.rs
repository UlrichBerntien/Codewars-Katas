use lazy_static::lazy_static;
use regex::Regex;

// Identifies postcodes.
// Returns "GB" on british postcode, "SK" on slovakian postcode, "Not valid" else.
// Ignores spaces around the postcode in the argument string.
fn which_postcode(s: &str) -> String {
    if POSTCODES_BRITISH.is_match(s) {
        "GB"
    } else if POSTCODES_SLOVAKIAN.is_match(s) {
        "SK"
    } else {
        "Not valid"
    }
    .to_string()
}

lazy_static! {
    static ref POSTCODES_BRITISH: Regex =
        Regex::new(r"^\s*[A-Za-z]{1,2}\d{1,2} \d[A-Za-z]{2}\s*$").unwrap();
    static ref POSTCODES_SLOVAKIAN: Regex = Regex::new(r"^\s*\d{3} \d{2}\s*$").unwrap();
}
