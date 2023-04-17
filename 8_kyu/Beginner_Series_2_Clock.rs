// Converts time h:m:s into milliseconds.
fn past(h: i32, m: i32, s: i32) -> i32 {
    ((h * 60 + m) * 60 + s) * 1000
}
