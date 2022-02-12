fn invert(values: &[i32]) -> Vec<i32> {
    values.iter().map(|x| -x).collect()
}