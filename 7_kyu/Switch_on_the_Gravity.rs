// Collects all blocks '#' in the lower rows.
// lst must be n x m matrix, each subvector same length.
fn switch_gravity(lst: &[Vec<char>]) -> Vec<Vec<char>> {
    let n_rows = lst.len();
    if n_rows < 1 {
        // empty input array lst
        return Vec::new();
    }
    // assume all rows have same length, the number of columns
    let n_cols = lst[0].len();
    // prepare the result, most elements will be empty '-'.
    let mut result = vec![vec!['-'; n_cols]; n_rows];
    // search the blocks and mark them in the result array
    for col in 0..n_cols {
        let mut dest_row = n_rows;
        for row in lst {
            if row[col] == '#' {
                dest_row -= 1;
                result[dest_row][col] = '#';
            }
        }
    }
    result
}
