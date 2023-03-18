// Returns true is the parens contains well formed parentheses pairs.
// Only parentheses "()" are allowed.
fn valid_parentheses(parens: &str) -> bool {
    let mut level: usize = 0;
    for c in parens.chars() {
        match c {
            '(' => level += 1,              // opening a new pair is ok
            ')' if level > 0 => level -= 1, // closing an open pair is ok
            _ => return false,              // everything else is invalid
        }
    }
    level == 0 // all pairs must be closed
}
