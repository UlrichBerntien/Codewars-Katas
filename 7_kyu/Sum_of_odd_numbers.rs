// Returns sum of the number in the n-th row of the "odd number triangle".
//   1
//  3 5
// 7 9 11
// ...
const fn row_sum_odd_numbers(n: i64) -> i64 {
    if n < 1 {
        return 0;
    };
    // Calculation based in the Gauss sum formula
    // Start number in the n-th row
    let start = 1 + (n - 1) * n;
    // There a n numbers in the n-th row
    start * n + (n - 1) * n
}
