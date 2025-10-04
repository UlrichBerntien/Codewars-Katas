// Calculates the minimal sum of pairwise multiplied numbers.
// Works only on non-negative numbers!
fn min_sum(xs: &[u64]) -> u64 {
    let mut xs = Vec::from(xs);
    xs.sort();
    let n = xs.len();
    let end = n - 1;
    (0..(n / 2)).map(|i| xs[i] * xs[end - i]).sum()
}
