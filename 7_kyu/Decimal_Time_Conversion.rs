use std::str::FromStr;

// Converts string "h:mm" into hours with fractional part.
// Fractional part rounded to 2 digits.
// Returns 0 on format errors.
fn string_to_industrial(time: &str) -> f64 {
    let parts: Vec<&str> = time.split(':').collect();
    if parts.len() != 2 {
        return 0.;
    }
    let h = f64::from_str(parts[0]);
    let m = f64::from_str(parts[1]);
    if let (Ok(h), Ok(m)) = (h, m) {
        h + round2digits(m / 60.)
    } else {
        0.
    }
}

// Converts minutes into hours with fractional part.
// Fractional part rounded to 2 digits.
fn to_industrial(time: u32) -> f64 {
    round2digits((time / 60) as f64 + (time % 60) as f64 / 60.)
}

// Converts hours with fractional part into "h:mm" format.
fn to_normal(time: f64) -> String {
    let hours = time.trunc();
    let minutes = time.fract() * 60.;
    format! {"{:0.0}:{:02.0}",hours,minutes}
}

// Returns x rounded to 2 digits.
fn round2digits(x: f64) -> f64 {
    (x * 100.).round() / 100.
}
