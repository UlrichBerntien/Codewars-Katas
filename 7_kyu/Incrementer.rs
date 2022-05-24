fn incrementer(nums: &[u32]) -> Vec<u32> {
    nums.iter()
        .enumerate()
        .map(|(i, x)| (x + 1 + (i % 10) as u32) % 10)
        .collect()
}
