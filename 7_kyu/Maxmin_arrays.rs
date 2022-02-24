fn solve(arr: &[i32]) -> Vec<i32> {
    let mut sorted = Vec::<i32>::from(arr);
    sorted.sort_unstable();
    let mut result = Vec::<i32>::with_capacity(sorted.len());
    let mut i = 0usize;
    let mut j = sorted.len() - 1;
    while i <= j {
        result.push(sorted[j]);
        j -= 1;
        if i > j {
            break;
        }
        result.push(sorted[i]);
        i += 1;
    }
    result
}
