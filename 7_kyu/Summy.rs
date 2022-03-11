fn summy(strng: &str) -> i32 {
    strng.split_whitespace().map(|s| s.parse::<i32>().unwrap()).sum()
}