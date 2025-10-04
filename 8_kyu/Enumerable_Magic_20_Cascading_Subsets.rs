// Returns array of all subarrays of length n.
fn each_cons(arr: &[u8], n: usize) -> Vec<Vec<u8>> {
    if arr.len() < n {
        Vec::new()
    } else {
        (0..arr.len() + 1 - n)
            .map(|s| arr[s..(s + n)].to_vec())
            .collect()
    }
}
