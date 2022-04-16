use std::collections::HashSet;

fn solve(a: &str, b: &str) -> String {
    // UTF-8 safe implementation via chars iterator.
    let set_a = HashSet::<char>::from_iter(a.chars());
    let set_b = HashSet::<char>::from_iter(b.chars());
    let set_diff = HashSet::<char>::from_iter(set_a.symmetric_difference(&set_b).cloned());
    a.chars()
        .chain(b.chars())
        .filter(|it| set_diff.contains(it))
        .collect()
}
