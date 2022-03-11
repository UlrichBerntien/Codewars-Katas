fn shared_bits(a: u32, b: u32) -> bool {
    let mut t = a & b;
    if t == 0 {
        return false;
    }
    while t & 1 == 0 {
        t >>= 1
    }
    t ^ 1 > 0
}
