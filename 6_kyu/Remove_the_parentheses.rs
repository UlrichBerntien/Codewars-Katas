fn remove_parentheses(s: &str) -> String {
    let mut result = String::with_capacity(s.len());
    let mut level = 0;
    for c in s.chars() {
        match c {
            '(' => level += 1,
            ')' if level > 0 => level -= 1,
            _ if level == 0 => result.push(c),
            _ => {}
        }
    }
    result
}
