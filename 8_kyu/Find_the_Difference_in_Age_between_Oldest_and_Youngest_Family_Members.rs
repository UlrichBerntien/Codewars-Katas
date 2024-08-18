/// Returns min, max, range of the ages.
/// Returns (0,0,0) if array ages is empty.
fn difference_in_ages(ages: &[u8]) -> (u8, u8, u8) {
    let min = *ages.iter().min().unwrap_or(&0);
    let max = *ages.iter().max().unwrap_or(&0);
    return (min,max,max-min);
}