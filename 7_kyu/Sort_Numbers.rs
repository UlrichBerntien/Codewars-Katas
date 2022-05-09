fn sort_numbers(arr: &Vec<i32>) -> Vec<i32> {
    let mut result = arr.to_owned();
    result.sort_unstable();
    result
}