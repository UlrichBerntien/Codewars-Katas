// Returns index of the least item larger a[i].
// Returns None if no element exists, returns last min if more than one exists.
fn least_larger(a: &[i32], i: usize) -> Option<usize> {
    if i >= a.len() {
        return None;
    }
    // The value of the element is the lower limit (exlusive)
    let limit = a[i];
    // search minimal element above limit
    let mut min = i32::MAX;
    let mut min_index: Option<usize> = None;
    for (i, &x) in a.iter().enumerate() {
        // check lerr-equal (!) to catch a value with i32::MAX in the array.
        if x > limit && x <= min {
            min_index = Some(i);
            min = x;
        }
    }
    min_index
}
