fn next_bigger_number(n: i64) -> i64 {
    // 1) Split into digits.
    let mut rest = n;
    let mut digits = Vec::<i64>::with_capacity(64 / 3);
    let mut max = -1;
    while rest > 0 {
        let last = rest % 10;
        rest /= 10;
        digits.push(last);
        if last > max {
            max = last;
        } else if last < max {
            // No need to split more digits
            break;
        }
    }
    // 2) Rearrange the digits to the next bigger number
    let last_index = digits.len() - 1;
    let last_value = digits[last_index];
    digits.sort_unstable_by(|x, y| y.cmp(x));
    let new_last = digits.iter().rev().position(|&it| it > last_value);
    if new_last == None {
        // No bigger number found
        return -1;
    }
    let new_last = last_index - new_last.unwrap();
    if digits[new_last] == 0 && rest == 0 {
        // Leading zero is not allowed
        return -1;
    }
    digits.push(digits[new_last]);
    digits.remove(new_last);
    // 3) Calculate the value from the new arranged digits
    while !digits.is_empty() {
        let d = digits.pop().unwrap();
        rest = rest * 10 + d;
    }
    rest
}
