fn prev_mult_of_three(n: i32) -> i32 {
    let mut x = n;
    while x % 3 > 0 { x /= 10 }
    if x < 3 { -1 } else { x }
}
