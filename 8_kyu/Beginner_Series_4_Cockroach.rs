// Converts km/h to cm/s and returns truncated integer.
fn cockroach_speed(s: f64) -> i64 {
    // 1 km/h = 100_000cm/3600s = 1000/26 cm/s
    (s * 1000. / 36.) as i64
}
