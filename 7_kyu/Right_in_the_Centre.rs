// Returns true if "abc" is in the middle of seq.
// Middle is interpreted on bytes, not on chars.
fn is_in_middle(seq: &str) -> bool {
    const SEARCH: &str = "abc";
    if seq.len() < SEARCH.len() {
        return false;
    }
    let option1: usize = (seq.len() + 1 - SEARCH.len()) / 2;
    let option2: usize = (seq.len() - SEARCH.len()) / 2;
    &seq[option1..option1 + 3] == SEARCH || &seq[option2..option2 + 3] == SEARCH
}
