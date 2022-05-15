fn power_mod(x: u64, y: u64, n: u64) -> u64 {
    // See https://en.wikipedia.org/wiki/Modular_exponentiation
    if n < 1 {
        0
    } else {
        let mut remain = 1;
        let mut base = x % n;
        let mut exponent = y;
        while exponent > 0 {
            if exponent % 2 == 1 {
                remain = (remain * base) % n;
            }
            base = (base * base) % n;
            exponent >>= 1;
        }
        remain
    }
}
