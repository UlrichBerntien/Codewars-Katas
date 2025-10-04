// Returns the non-unique number in the array.
// All other numbers are equal. Only one number differs from the rest.
fn find_uniq(arr: &[f64]) -> f64 {
    if arr.len() < 3 {
        // not enough numbers to identify the "unique number"
        panic!();
    }
    // If the "unique number" is not at index 0 then it must at index 1.
    let the_number = if arr[0] == arr[1] || arr[0] == arr[2] {
        arr[0]
    } else {
        arr[1]
    };
    // Return the not unique number or panic.
    *(*arr).iter().find(|&x| *x != the_number).unwrap()
}
