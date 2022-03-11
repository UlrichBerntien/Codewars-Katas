fn round_to_next_5(n: i32) -> i32 {
    let rem = n.rem_euclid(5);
    if rem == 0 {
        n
    } else {
        n + 5 - rem
    }
}
