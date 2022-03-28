use itertools::Itertools;
use itertools::MinMaxResult;

fn max_diff(numbers: &[i32]) -> i32 {
    // minmax does 1.5 * n comparisons, and so is faster than calling min and max separately which does 2 * n comparisons.
    match numbers.iter().minmax() {
        MinMaxResult::NoElements | MinMaxResult::OneElement(_) => 0,
        MinMaxResult::MinMax(min, max) => max - min,
    }
}
