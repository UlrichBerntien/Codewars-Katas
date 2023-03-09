use itertools::Itertools;
use itertools::MinMaxResult;

// Find maximum and minimum of the numbers in the string.
// Returns the result as string "max min".
// Accepts whitespace separated decimal numbers in int64 range.
// Ignores all other elements of the string.
fn high_and_low(numbers: &str) -> String {
    let mm = numbers
        .split_whitespace()
        .map(|s| s.parse::<i64>())
        .filter(|result| !result.is_err())
        .map(|result| result.unwrap())
        .minmax();
    match mm {
        MinMaxResult::NoElements => String::new(),
        MinMaxResult::OneElement(m) => format!("{} {}", m, m),
        MinMaxResult::MinMax(min, max) => format!("{} {}", max, min),
    }
}
