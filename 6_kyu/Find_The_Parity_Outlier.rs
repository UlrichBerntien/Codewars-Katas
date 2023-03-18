// Finds the first even or odd outlier in the values.
// Returns the value of the first number that differs from the first 3 elements of the majority.
fn find_outlier(values: &[i32]) -> i32 {
    if values.len() < 3 {
        panic!("missing values, len < 3")
    };
    // Check the first 3 elements to find the majority.
    // 3 is enough, as only 1 outlier is allowed according to the specification.
    let most_odd: i32 = if values[0..3].iter().map(|&x| 1&x).sum::<i32>() > 1 { 1 } else { 0 };
    // Search for the outlier.
    if let Some(outlier) = values.iter().find(|&&x| 1&x != most_odd) {
        *outlier
    } else {
        // All elements with the same even/odd bit.
        panic!("no outlier")
    }
}
