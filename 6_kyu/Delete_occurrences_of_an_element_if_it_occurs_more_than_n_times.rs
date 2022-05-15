fn delete_nth(lst: &[u8], n: usize) -> Vec<u8> {
    let mut seen = [0_usize; u8::MAX as usize + 1];
    lst.iter()
        .copied()
        .filter(|&x| {
            seen[x as usize] += 1;
            seen[x as usize] <= n
        })
        .collect()
}
