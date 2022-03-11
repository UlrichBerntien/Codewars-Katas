// Used units in the output string.
// Each item: (count up to next unit, name of the unit without plural "s").
static UNITS: [(u64, &str); 5] = [
    (60, "second"),
    (60, "minute"),
    (24, "hour"),
    (365, "day"),
    (u64::MAX, "year"),
];

fn format_duration(seconds: u64) -> String {
    // 1) Split the seconds into parts
    let mut parts = Vec::<String>::with_capacity(UNITS.len());
    let mut rest = seconds;
    for (count, name) in UNITS {
        let n = rest % count;
        rest /= count;
        if n > 0 {
            parts.push(format!("{} {}{}", n, name, if n > 1 { "s" } else { "" }));
        }
    }
    // 2) Combine the parts wtih biggest unit first
    parts.reverse();
    match parts.len() {
        0 => String::from("now"),
        1 => parts.pop().unwrap(),
        n => format!("{} and {}", parts[0..n - 1].join(", "), parts[n - 1]),
    }
}
