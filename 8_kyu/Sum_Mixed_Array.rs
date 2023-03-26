use either::Either;
use std::str::FromStr;

// Returns sum of all numbers in arr.
// Interprets strings as decimal numbers, ignores invalid formated strings.
fn sum_mix(arr: &[Either<i32, String>]) -> i32 {
    arr.iter()
        .map(|x| -> i32 {
            match x {
                Either::Left(n) => *n,
                Either::Right(s) => i32::from_str(s).unwrap_or(0),
            }
        })
        .sum()
}
