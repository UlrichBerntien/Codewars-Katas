// Returns minimum of items in arr.
// Returns 0 if arr is empty.
fn minimum(arr: &[i32]) -> i32 {
    match arr.iter().min() {
        None => 0,
        Some(x) => *x,
    }
}

// Returns maximum of items in arr.
// Returns 0 if arr is empty.
fn maximum(arr: &[i32]) -> i32 {
    match arr.iter().max() {
        None => 0,
        Some(x) => *x,
    }
}
