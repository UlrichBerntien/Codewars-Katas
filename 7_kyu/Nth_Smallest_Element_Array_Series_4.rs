// Returns n-th smallest element.
// Minimum is returned by n=1.
fn nth_smallest(nums: &[i32], pos: usize) -> i32 {
    if pos < 1 || pos > nums.len() {
        panic!()
    }
    let mut tmp = Vec::from(nums);
    tmp.sort_unstable();
    tmp[pos - 1]
}
