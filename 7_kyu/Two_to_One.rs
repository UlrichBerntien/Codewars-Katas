fn longest(a1: &str, a2: &str) -> String {
    let mut accu: Vec<char> = Vec::with_capacity(a1.len() + a2.len());
    accu.extend(a1.chars());
    accu.extend(a2.chars());
    accu.sort_unstable();
    accu.dedup();
    accu.iter().collect()
}
