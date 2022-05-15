fn cycle(n: i64) -> i64 {
    if n % 5 == 0 || n % 2 == 0 {
        return -1;
    }
    let mut digits: i64 = 0;
    let mut remainder: i64 = 1;
    loop {
        digits += 1;
        remainder = (remainder * 10) % n;
        if remainder == 1 {
            break;
        }
    }
    digits
}
