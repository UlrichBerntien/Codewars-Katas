// Reverse all sublistes of even numbers.
fn rev_sub(xs: &[i32]) -> Vec<i32> {
    // Buffer to create the result
    let mut result = Vec::with_capacity(xs.len());
    let mut i = 0_usize;
    while i < xs.len() {
        if xs[i] % 2 == 0 {
            // a sublist of even numbers
            let start = i;
            i += 1;
            while i < xs.len() && xs[i] % 2 == 0 {
                i += 1;
            }
            result.extend(xs[start..i].iter().rev());
        } else {
            // a sublist of odd numbers
            let start = i;
            i += 1;
            while i < xs.len() && xs[i] % 2 != 0 {
                i += 1;
            }
            result.extend_from_slice(&xs[start..i]);
        }
    }
    result
}
