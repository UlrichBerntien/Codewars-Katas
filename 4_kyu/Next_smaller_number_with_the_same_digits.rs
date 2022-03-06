fn next_smaller_number(n: u64) -> Option<u64> {
    // 1) Split into digits.
    let mut rest = n;
    let mut digits = Vec::<u64>::with_capacity(64 / 3);
    let mut min = 10;
    while rest > 0 {
        let last = rest % 10;
        rest /= 10;
        digits.push(last);
        if last < min {
            min = last;
        } else if last > min {
            // No need to split more digits
            break;
        }
    }
    // 2) Rearrange the digits to the next smaller number
    let last_index = digits.len() - 1;
    let last_value = digits[last_index];
    digits.sort_unstable();
    let new_last = digits.iter().rev().position(|&it| it < last_value);
    if new_last == None {
        // No smaller number found
        return None;
    }
    let new_last = last_index - new_last.unwrap();
    if digits[new_last] == 0 && rest == 0 {
        // Leading zero is not allowed
        return None;
    }
    digits.push(digits[new_last]);
    digits.remove(new_last);
    // 3) Calculate the value from the new arranged digits
    while !digits.is_empty() {
        let d = digits.pop().unwrap();
        rest = rest * 10 + d;
    }
    Some(rest)
}
