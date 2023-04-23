// Returns RGB string with maximal value.
// Returns first string if maximal value is in more than one string.
// Returns black if array is empty.
fn brightest(colors: &[String]) -> String {
    match colors.iter().rev().max_by_key(|&s| value(s)) {
        Some(m) => m.clone(),
        None => String::from("#000000"),
    }
}

// Returns value of a hex RGB string (#RRGGBB).
// Uses 0 as error fallback if some color code is invalid.
fn value(rgb: &String) -> u8 {
    if rgb.len() != 7 {
        return 0;
    };
    let r = u8::from_str_radix(&rgb[1..3], 16).unwrap_or(0);
    let g = u8::from_str_radix(&rgb[3..5], 16).unwrap_or(0);
    let b = u8::from_str_radix(&rgb[5..7], 16).unwrap_or(0);
    r.max(g).max(b)
}
