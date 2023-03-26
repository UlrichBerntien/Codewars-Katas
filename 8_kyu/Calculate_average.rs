// Returns arithmetic mean value.
// Returns 0 if the slice is empty.
fn find_average(slice: &[f64]) -> f64 {
    if slice.is_empty() {
        0.
    } else {
        slice.iter().sum::<f64>() / slice.len() as f64
    }
}
