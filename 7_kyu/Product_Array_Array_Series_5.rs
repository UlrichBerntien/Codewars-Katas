// Retuns product of all numbers.
// Returns u128 to avoid overflows.
fn mult_array(arr: &[u64]) -> u128 {
    arr.iter().fold(1u128, |accu, x| accu * *x as u128)
}

// Returns an array each element x[i] is the product of all numbers in arr without arr[i].
fn product_array(arr: &[u64]) -> Vec<u64> {
    let all = mult_array(arr);
    arr.iter().map(|x| (all / (*x as u128)) as u64).collect()
}
