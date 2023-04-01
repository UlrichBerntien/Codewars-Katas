fn dots_on_domino_bones(n: i32) -> Option<u64> {
    if n < 0 {
        return None;
    }
    let mut sum: u64 = 0;
    for i in 1..=(n as u64) {
        let p = (i + 1) * i;
        sum += p;
        sum += p / 2
    }
    Some(sum)
}
