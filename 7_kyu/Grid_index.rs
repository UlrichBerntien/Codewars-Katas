// Translates indices into strings based on the characters in the grid.
// The indices (1..) are indices flattened into the square grid.
fn grid_index(grid: &[Vec<char>], indices: &[usize]) -> String {
    // length of grid and length of all vectors in grid must be n.
    let n: usize = grid.len();
    assert!(n > 0);
    assert!(grid.iter().all(|it| it.len() == n));
    indices
        .iter()
        .map(|it| {
            // index in indices starts at 1.
            let i: usize = it - 1;
            assert!(i < n * n);
            grid[i / n][i % n]
        })
        .collect()
}
