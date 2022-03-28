pub fn remove_char(s: &str) -> String {
    let chars: Vec<char> = s.chars().collect();
    if chars.len() < 2 {
        String::new()
    } else {
        chars[1..chars.len() - 1].iter().collect()
    }
}
