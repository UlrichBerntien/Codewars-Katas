fn make_valley(arr: Vec<i32>) -> Vec<i32> {
    // 1. step sort the values
    let mut sorted: Vec<i32> = arr;
    sorted.sort_unstable();
    // 2. step arrange the values in valley form
    let mut valley: Vec<i32> = Vec::with_capacity(sorted.len());
    valley.extend(sorted.iter().rev().step_by(2));
    valley.extend(sorted[sorted.len() % 2..].iter().step_by(2));
    valley
}
