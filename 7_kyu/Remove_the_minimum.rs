use itertools::Itertools;

// Returns a copy of numbers without the smallest element.
// Removes only the first min if the min value occurs multiple times.
fn remove_smallest(numbers: &[u32]) -> Vec<u32> {
    if numbers.is_empty() {
        return Vec::new();
    }
    // Find position of first minimal value.
    // Unwrap is save because number is not empty.
    let first_min = numbers.iter().position_min().unwrap();
    // Prepare vector to hold all items of numbers without the min
    let mut accu: Vec<u32> = Vec::with_capacity(numbers.len() - 1);
    // Copies values without the min item
    accu.extend_from_slice(&numbers[..first_min]);
    accu.extend_from_slice(&numbers[(first_min + 1)..]);
    accu
}
