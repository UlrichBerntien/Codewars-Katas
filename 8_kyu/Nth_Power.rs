fn index(nums: &[u64], n: usize) -> Option<u64> {
    if n < nums.len() {Some(nums[n].pow(n as u32))} else {None}
}