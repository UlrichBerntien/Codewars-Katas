fn all_non_consecutive(arr: &[i32]) -> Vec<(usize, i32)> {
    let mut accu: Vec<(usize, i32)> = Vec::new();
    for index in 1..arr.len() {
        if arr[index] - arr[index - 1] != 1 {
            accu.push((index, arr[index]));
        }
    }
    accu
}
