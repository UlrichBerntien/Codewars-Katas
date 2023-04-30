fn sum_or_product(list: &[i64], n: usize) -> String {
    if list.len() < n {
        return "list to short".to_string();
    }
    let mut arr: Vec<i64> = Vec::from(list);
    arr.sort_unstable();
    // use f64 to avoid overflows
    let n_sum: f64 = arr[arr.len() - n..].iter().map(|&x| x as f64).sum();
    let n_product: f64 = arr[..n].iter().map(|&x| x as f64).product();
    (if (n_sum - n_product).abs() < 0.5 {
        // use 0.5 as limit for "equal" because the sum and product should be integer values.
        "same"
    } else if n_sum > n_product {
        "sum"
    } else {
        "product"
    })
    .to_string()
}
