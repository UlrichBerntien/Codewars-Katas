use std::str::FromStr;

fn string_to_number(s: &str) -> i32 {
    i32::from_str(s).unwrap()
}
