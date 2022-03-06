use std::collections::HashSet;

fn destroy(input_sets: Vec<HashSet<char>>) -> String {
    let mut s = [
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
        "s", "t", "u", "v", "w", "x", "y", "z",
    ];
    for set in input_sets.iter() {
        for &c in set.iter() {
            if c.is_ascii_alphabetic() && c.is_lowercase() {
                s[c as usize - 'a' as usize] = "_";
            }
        }
    }
    s.join(" ")
}
