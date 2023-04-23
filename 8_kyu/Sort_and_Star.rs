// Returns the minimal string "stared".
// Stared means '***' between each character.
fn two_sort(arr: &[&str]) -> String {
    star(arr.iter().min().unwrap_or(&""))
}

// Returns s with "***" between each char.
fn star(s: &str) -> String {
    let mut accu = String::with_capacity(s.len() * 4);
    let mut source = s.chars();
    if let Some(first) = source.next() {
        accu.push(first);
    }
    for c in source {
        accu.push_str("***");
        accu.push(c);
    }
    accu
}
