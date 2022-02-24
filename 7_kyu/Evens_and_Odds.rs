fn evens_and_odds(n: u64) -> String {
    if n&1 == 1 {format!("{:x}",n)} else {format!("{:b}",n)}
}