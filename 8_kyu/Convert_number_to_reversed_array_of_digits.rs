fn digitize(n: u64) -> Vec<u8> {
    let mut result: Vec<u8> = Vec::with_capacity(20);
    let mut remain = n;
    while remain > 0 {
        result.push((remain % 10) as u8);
        remain /= 10;
    }
    if result.is_empty() {
        result.push(0);
    }
    result
}
