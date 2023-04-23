// Returns sum of all goals.
fn goals(a: i32, b: i32, c: i32) -> i32 {
    if a < 0 || b < 0 || c < 0 {
        panic!("negative number of goals")
    }
    a+b+c
}