// Returns minimum of arr or 0 if arr is empty.
fn find_smallest_int(arr: &[i32]) -> i32 {
    arr.iter().cloned().min().unwrap_or(0)
}
