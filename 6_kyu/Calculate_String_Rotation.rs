fn shifted_diff(first: &str, second: &str) -> Option<usize> {
    let first_array: Vec<char> = first.chars().collect();
    let len = first_array.len();
    let second_array: Vec<char> = second.chars().collect();
    if len != second_array.len() {
        return None;
    }
    let shift_equal =
        |shift| (0..len).all(|it| first_array[it] == second_array[(it + shift) % len]);
    for shift in 0..len {
        if shift_equal(shift) {
            return Some(shift);
        }
    }
    None
}
