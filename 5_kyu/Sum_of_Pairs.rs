use std::collections::HashSet;

// Returns a pair of two ints with sum s.
// Returns None of no pair in the ints has sum s.
fn sum_pairs(ints: &[i8], s: i8) -> Option<(i8, i8)> {
    // HEre store the integers seen so far in the array.
    let mut seen: HashSet<i8> = HashSet::with_capacity(ints.len());
    for &x in ints.iter() {
        // This x is one part of the pair if y is in the ints array.
        let y = s - x;
        if seen.contains(&y) {
            // Found one pair; return immediately.
            return Some((y, x));
        }
        // Store the seen integer.
        seen.insert(x);
    }
    // No pair with given sum s found.
    None
}
