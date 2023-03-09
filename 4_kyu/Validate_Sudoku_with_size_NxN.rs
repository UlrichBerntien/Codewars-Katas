struct Sudoku {
    data: Vec<Vec<u32>>,
}

impl Sudoku {
    // Check: data has NxN form, all vector length must be N.
    fn is_form_valid(&self, n: u32) -> bool {
        let nu = n as usize;
        self.data
            .iter()
            .fold(self.data.len() == nu, |ok, row| ok && row.len() == nu)
    }

    // Check: all rows in the Sudoku are valid filled.
    fn are_rows_valid(&self, n: u32) -> bool {
        let n_plus = n as usize + 1;
        // use value 1..n as index in the collector, so length is n+1
        let mut collector = Vec::<bool>::with_capacity(n_plus);
        for row in &self.data {
            collector.clear();
            collector.resize(n_plus, false);
            for &x in row {
                if x < 1 || x > n || collector[x as usize] {
                    return false;
                }
                collector[x as usize] = true;
            }
        }
        true
    }

    // Check: all columns in the Sudoku are valid filled.
    fn are_columns_valid(&self, n: u32) -> bool {
        let n_size = n as usize;
        let n_plus = n_size + 1;
        // use value 1..n as index in the collector, so length is n+1
        let mut collector = Vec::<bool>::with_capacity(n_plus);
        for irow in 0..n_size {
            collector.clear();
            collector.resize(n_plus, false);
            for icol in 0..n_size {
                let x = self.data[icol][irow];
                if x < 1 || x > n || collector[x as usize] {
                    return false;
                }
                collector[x as usize] = true;
            }
        }
        true
    }

    // Check: all subsquares in the Sudoku are valid filled.
    fn are_subsquares_valid(&self, n: u32) -> bool {
        let n_size = n as usize;
        let n_plus = n_size + 1;
        // use value 1..n as index in the collector, so length is n+1
        let mut collector = Vec::<bool>::with_capacity(n_plus);
        let n_sub = (n as f32).sqrt().floor() as u32;
        let n_sub_size = n_sub as usize;
        if n_sub * n_sub != n {
            return false;
        }
        for hindex in (0..n_size).step_by(n_sub_size) {
            for vindex in (0..n_size).step_by(n_sub_size) {
                // Check square with start coordinate (col = hindex, row = vindex)
                collector.clear();
                collector.resize(n_plus, false);
                for irow in 0..n_sub_size {
                    for &x in &(self.data[vindex + irow])[hindex..hindex + n_sub_size] {
                        if x < 1 || x > n || collector[x as usize] {
                            return false;
                        }
                        collector[x as usize] = true;
                    }
                }
            }
        }
        true
    }

    // Validate Sudoku of size N.
    fn is_valid(&self) -> bool {
        let nu = self.data.len();
        if nu > u32::max as usize {
            return false;
        }
        let n = nu as u32;
        self.is_form_valid(n)
            && self.are_rows_valid(n)
            && self.are_columns_valid(n)
            && self.are_subsquares_valid(n)
    }
}
