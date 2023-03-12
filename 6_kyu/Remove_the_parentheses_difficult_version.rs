// Returns a string s with all parts in parentheses removed.
// If the parentheses are not balanced, the shorter parentheses pair will be removed.
fn remove_parentheses(s: &str) -> String {
    let mut dest = String::with_capacity(s.len());
    let mut open_index = Vec::<usize>::new();
    for c in s.chars() {
        match c {
            '(' => {
                open_index.push(dest.len());
                dest.push(c);
            }
            ')' => {
                if let Some(last) = open_index.pop() {
                    dest.truncate(last)
                } else {
                    dest.push(c)
                }
            }
            _ => dest.push(c),
        }
    }
    dest
}
