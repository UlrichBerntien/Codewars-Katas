use core::cmp::max;

// Returns the maximal sum between negative numbers in nums.
// Ignores number before the first negative and after the last negative value.
fn max_sum_between_two_negatives(nums: &[i32]) -> Option<i32> {
    let mut max_sum: Option<i32> = None;
    nums.iter().fold(None, |accu, &x| {
        if x < 0 {
            max_sum = max_option(max_sum, accu);
            Some(0)
        } else {
            add_option(accu, x)
        }
    });
    max_sum
}

// Returns maximums of the values, returns None if no value is given.
fn max_option(a: Option<i32>, b: Option<i32>) -> Option<i32> {
    match (a, b) {
        (Some(x), Some(y)) => Some(max(x, y)),
        (x, None) => x,
        (_, y) => y,
    }
}

// Returns sum of a and b if a is set else return None.
fn add_option(a: Option<i32>, b: i32) -> Option<i32> {
    a.map(|x| x + b)
}
