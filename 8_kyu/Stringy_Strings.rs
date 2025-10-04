// Returns string of given length filled with pattern "1010..."
fn stringy(size: usize) -> String {
    let mut str = "10".repeat((size+1)/2);
    if str.len() > size {
        str.pop();
    }
    str
}
