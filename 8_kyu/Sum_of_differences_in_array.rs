// Returns sum of all differences between ordered pairs of arr.
// = Returns width of the array
// = Returns max-min
// Returns None if array has less than 2 items.
fn sum_of_differences(arr: &[i8]) -> Option<i8> {
    if arr.len() > 1 {
        Some(arr.iter().max().unwrap() - arr.iter().min().unwrap())
    } else {
        None
    }
}
