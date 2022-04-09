fn in_array(arr_a: &[&str], arr_b: &[&str]) -> Vec<String> {
    let is_in = |s: &&&str| arr_b.iter().any(|it| it.contains(**s));
    let mut result: Vec<String> = arr_a
        .iter()
        .filter(is_in)
        .map(|it| it.to_string())
        .collect();
    result.sort_unstable();
    result.dedup();
    result
}
