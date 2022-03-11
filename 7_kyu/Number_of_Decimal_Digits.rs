fn digits(n: u64) -> usize {
    let mut count = 1usize;
    let mut n = n;
    while {
        n /= 10;
        n > 0
    } {
        count += 1;
    }
    count
}
