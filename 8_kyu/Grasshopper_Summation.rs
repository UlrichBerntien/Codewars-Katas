// Returns sum of all integers 1,2,3,..,n.
fn summation(n: i32) -> i32 {
    // use i64 integers for temporary product
    let nn = n as i64;
    // Gauss sum formula
    ((nn*(nn+1))/2) as i32
}
