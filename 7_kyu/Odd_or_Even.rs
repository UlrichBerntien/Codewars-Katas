// Checks if sum of numbers is even or odd.
fn odd_or_even(numbers: Vec<i32>) -> String {
    if numbers.iter().fold(0i8, |accu, x| accu ^ (x & 1) as i8) == 0 {
        "even"
    } else {
        "odd"
    }
    .to_string()
}
