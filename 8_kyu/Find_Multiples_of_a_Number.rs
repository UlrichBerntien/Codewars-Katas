fn find_multiples(n: u32, limit: u32) -> Vec<u32> {
    (n..=limit).step_by(n as usize).collect()
}