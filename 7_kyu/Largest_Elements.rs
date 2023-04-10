// Returns the n largest items of the array xs.
// Returns the items sorted.
fn largest(n: usize, xs: &[i32]) -> Vec<i32> {
    let mut v: Vec<i32> = Vec::from(xs);
    v.sort_unstable();
    if n >= v.len() {
        // Return the complete vector
        return v
    }
    // Return the content start..end of the vector
    let start = v.len()-n;
    v.copy_within(start..,0);
    v.truncate(n);
    v
}
