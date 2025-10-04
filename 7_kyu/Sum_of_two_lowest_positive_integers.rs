use std::cmp::{max, min};

/// Adds the two lowest integers in the array numbers.
/// Returns 0 if array is empty.
/// Value of the item if only one item is in the array.
fn sum_two_smallest_numbers(numbers: &[u32]) -> u32 {
    match numbers {
        [] => 0,
        [a] => *a,
        [a, b] => a + b,
        _ => {
            let mut least = min(numbers[0], numbers[1]);
            let mut least2 = max(numbers[0], numbers[1]);
            for &it in numbers[2..].iter() {
                if it < least {
                    least2 = least;
                    least = it
                } else if it < least2 {
                    least2 = it
                }
            }
            least + least2
        }
    }
}
