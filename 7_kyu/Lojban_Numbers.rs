use lazy_static::lazy_static;
use std::collections::HashMap;

// Parse Lojban Number.
// Panic if number is not correct.
fn convert_lojban(input: &str) -> u64 {
    input
        .chars()
        .collect::<Vec<char>>()
        // All digits are exact 2 chars
        .chunks_exact(2)
        .map(|name| {
            // Panics if first char is invalid.
            let (c2, value) = FIRST2VALUE[&name[0]];
            if c2 == name[1] {
                value
            } else {
                // Name of the digit is invalid, only first char was ok
                panic!()
            }
        })
        .fold(0u64, |accu, x| accu * 10 + x as u64)
}

// Names of the digits 0, 1, .., 9
const LOJBAN_DIGITS: [&str; 10] = ["no", "pa", "re", "ci", "vo", "mu", "xa", "ze", "bi", "so"];

lazy_static! {
    // Lookup value of the digit by frist char of the name.
    // Value is the second char (for check) and the value of the digit.
    static ref FIRST2VALUE: HashMap<char, (char, u8)> = LOJBAN_DIGITS
        .iter()
        .enumerate()
        .map(|(i, &name)| {
            let n: Vec<char> = name.chars().collect();
            (n[0], (n[1], i as u8))
        })
        .collect();
}
