// Merge content of the arrays into one sorted vector.
fn merge_arrays(arr1: &[i32], arr2: &[i32]) -> Vec<i32> {
    let mut accu :Vec<i32> = Vec::with_capacity(arr1.len() + arr2.len());
    accu.extend(arr1);
    accu.extend(arr2);
    // Standard Rust sort is optimized for this case. See docu:
    // "It is designed to be very fast in cases where the slice is nearly sorted,
    // or consists of two or more sorted sequences concatenated one after another."
    accu.sort_unstable();
    accu.dedup();
    accu
}
