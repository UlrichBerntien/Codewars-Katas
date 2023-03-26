// Solve the given puzzle in place, no need to return a copy
fn sudoku(puzzle: &mut [[u8; 9]; 9]) {
    let mut worker = SudokuSolver::build_solver(puzzle);
    worker.solve();
    if !worker.has_solution() {
        panic!("no solution found")
    }
    worker.to_grid_in(puzzle);
}

// ----------------------------------------------------------------------------------------

#[derive(Clone)]
struct SudokuSolver {
    n_missing: u16,             // Number of missing numbers = Number of open fields
    cell: [u8; 9 * 9],          // The cells of the sudoku, value 0 means number is not set
    cell_options: [u16; 9 * 9], // possible numbers for this cell
}

impl SudokuSolver {
    // Creates new Soduko solver for the given puzzle.
    fn build_solver(puzzle: &[[u8; 9]; 9]) -> Box<SudokuSolver> {
        let mut solver = Box::new(SudokuSolver {
            n_missing: 9 * 9,
            cell: [0; 9 * 9],
            cell_options: [0x1ff; 9 * 9],
        });
        for (y, row) in puzzle.iter().enumerate() {
            for (x, &item) in row.iter().enumerate() {
                if item > 0 {
                    solver.set(HELPER.xy2index(x, y), item)
                }
            }
        }
        solver
    }

    // Try to find a solution.
    // Stops after first solution or found no solution.
    fn solve(&mut self) {
        if self.has_solution() {
            return;
        }
        // First: analytical solutions, set all cell values given direct by rules
        loop {
            // Search a field with exact one option for a number
            let fixed = self
                .cell_options
                .iter()
                .enumerate()
                .find(|&x| x.1.count_ones() == 1);
            if fixed == None {
                break;
            }
            let fixed = fixed.unwrap();
            self.set(fixed.0, HELPER.option2value(*fixed.1))
        }
        if self.has_solution() {
            return;
        }
        // Second: trial and error
        let min_options = self
            .cell_options
            .iter()
            .map(|&x| if x == 0 { 99u32 } else { x.count_ones() })
            .min()
            .unwrap();
        let trial_cell = self
            .cell_options
            .iter()
            .enumerate()
            .find(|&x| x.1.count_ones() == min_options)
            .unwrap();
        for trial_value in 1..=9 {
            if HELPER.value2option(trial_value) & trial_cell.1 > 0 {
                // trial a option on a copy of the current status
                let mut copy = self.clone();
                copy.set(trial_cell.0, trial_value);
                copy.solve();
                if copy.has_solution() {
                    // trail solved the problem
                    *self = copy;
                    return;
                }
            }
        }
    }

    // Exports the current status of the sudoku.
    // It is the puzzle after init or the solution after solve.
    fn to_grid_in(&self, dest: &mut [[u8; 9]; 9]) {
        for (y, row) in dest.iter_mut().enumerate() {
            for (x, item) in row.iter_mut().enumerate() {
                *item = self.cell[HELPER.xy2index(x, y)]
            }
        }
    }

    // Checks if a solution is stored in the solver.
    fn has_solution(&self) -> bool {
        self.n_missing == 0
    }

    // Sets a cell to a value.
    // Updates all associated values, e.g. the options of other cells.
    fn set(&mut self, index: usize, value: u8) {
        if self.cell[index] != 0 {
            panic!("reset cell value")
        }
        self.cell[index] = value;
        let option_mask = !HELPER.value2option(value);
        for &assocs in HELPER.associated_indices(index) {
            self.cell_options[assocs] &= option_mask;
        }
        self.cell_options[index] = 0;
        self.n_missing -= 1;
    }
}

// ----------------------------------------------------------------------------------------

// Collection of static data and function used by the Sudoku solver.
struct SudokuHelper {
    options: [u16; 10],                 // Option bit for each value.
    associations: [[usize; 20]; 9 * 9], // cell indices of the associated cells
}

impl SudokuHelper {
    // Convert coordinates to field index in a sudoku.
    // x = horizontal 0..9, y = vertical 0..9, index = 0..81
    const fn xy2index(&self, x: usize, y: usize) -> usize {
        x + y * 9
    }

    // Converts a value 1..10 into the bit in the options
    const fn value2option(&self, value: u8) -> u16 {
        self.options[value as usize]
    }

    // Converts an option with one bit set into the value.
    const fn option2value(&self, opt: u16) -> u8 {
        assert!(opt.count_ones() == 1);
        1 + opt.trailing_zeros() as u8
    }

    // Returns an iterator thru all indices of the associated cells.
    // Associated cells are in the same row, same column or same square.
    fn associated_indices(&self, index: usize) -> std::slice::Iter<'_, usize> {
        self.associations[index].iter()
    }

    // Generates the initialisation data for the associated cells.
    // The functions prints the data used in this source code.
    fn print_associated_indices(&self) {
        for y in 0..9 {
            for x in 0..9 {
                let mut accu: Vec<usize> = Vec::new();
                for i in 0..9 {
                    if i != y {
                        accu.push(self.xy2index(x, i))
                    }
                    if i != x {
                        accu.push(self.xy2index(i, y))
                    }
                }
                for i in 0..3 {
                    for j in 0..3 {
                        let xi = i + x - x % 3;
                        let yj = j + y - y % 3;
                        if x != xi && y != yj {
                            accu.push(self.xy2index(xi, yj))
                        }
                    }
                }
                accu.sort_unstable();
                accu.dedup();
                println!("{:?},", accu);
            }
        }
    }
}

// Only one static instance of the helper is needed.
static HELPER: SudokuHelper = SudokuHelper {
    options: [
        0x000, 0x001, 0x002, 0x004, 0x008, 0x010, 0x020, 0x0040, 0x080, 0x100,
    ],
    associations: [
        [
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 18, 19, 20, 27, 36, 45, 54, 63, 72,
        ],
        [
            0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 18, 19, 20, 28, 37, 46, 55, 64, 73,
        ],
        [
            0, 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 18, 19, 20, 29, 38, 47, 56, 65, 74,
        ],
        [
            0, 1, 2, 4, 5, 6, 7, 8, 12, 13, 14, 21, 22, 23, 30, 39, 48, 57, 66, 75,
        ],
        [
            0, 1, 2, 3, 5, 6, 7, 8, 12, 13, 14, 21, 22, 23, 31, 40, 49, 58, 67, 76,
        ],
        [
            0, 1, 2, 3, 4, 6, 7, 8, 12, 13, 14, 21, 22, 23, 32, 41, 50, 59, 68, 77,
        ],
        [
            0, 1, 2, 3, 4, 5, 7, 8, 15, 16, 17, 24, 25, 26, 33, 42, 51, 60, 69, 78,
        ],
        [
            0, 1, 2, 3, 4, 5, 6, 8, 15, 16, 17, 24, 25, 26, 34, 43, 52, 61, 70, 79,
        ],
        [
            0, 1, 2, 3, 4, 5, 6, 7, 15, 16, 17, 24, 25, 26, 35, 44, 53, 62, 71, 80,
        ],
        [
            0, 1, 2, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 27, 36, 45, 54, 63, 72,
        ],
        [
            0, 1, 2, 9, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 28, 37, 46, 55, 64, 73,
        ],
        [
            0, 1, 2, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 29, 38, 47, 56, 65, 74,
        ],
        [
            3, 4, 5, 9, 10, 11, 13, 14, 15, 16, 17, 21, 22, 23, 30, 39, 48, 57, 66, 75,
        ],
        [
            3, 4, 5, 9, 10, 11, 12, 14, 15, 16, 17, 21, 22, 23, 31, 40, 49, 58, 67, 76,
        ],
        [
            3, 4, 5, 9, 10, 11, 12, 13, 15, 16, 17, 21, 22, 23, 32, 41, 50, 59, 68, 77,
        ],
        [
            6, 7, 8, 9, 10, 11, 12, 13, 14, 16, 17, 24, 25, 26, 33, 42, 51, 60, 69, 78,
        ],
        [
            6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 24, 25, 26, 34, 43, 52, 61, 70, 79,
        ],
        [
            6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 24, 25, 26, 35, 44, 53, 62, 71, 80,
        ],
        [
            0, 1, 2, 9, 10, 11, 19, 20, 21, 22, 23, 24, 25, 26, 27, 36, 45, 54, 63, 72,
        ],
        [
            0, 1, 2, 9, 10, 11, 18, 20, 21, 22, 23, 24, 25, 26, 28, 37, 46, 55, 64, 73,
        ],
        [
            0, 1, 2, 9, 10, 11, 18, 19, 21, 22, 23, 24, 25, 26, 29, 38, 47, 56, 65, 74,
        ],
        [
            3, 4, 5, 12, 13, 14, 18, 19, 20, 22, 23, 24, 25, 26, 30, 39, 48, 57, 66, 75,
        ],
        [
            3, 4, 5, 12, 13, 14, 18, 19, 20, 21, 23, 24, 25, 26, 31, 40, 49, 58, 67, 76,
        ],
        [
            3, 4, 5, 12, 13, 14, 18, 19, 20, 21, 22, 24, 25, 26, 32, 41, 50, 59, 68, 77,
        ],
        [
            6, 7, 8, 15, 16, 17, 18, 19, 20, 21, 22, 23, 25, 26, 33, 42, 51, 60, 69, 78,
        ],
        [
            6, 7, 8, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 26, 34, 43, 52, 61, 70, 79,
        ],
        [
            6, 7, 8, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 35, 44, 53, 62, 71, 80,
        ],
        [
            0, 9, 18, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 45, 46, 47, 54, 63, 72,
        ],
        [
            1, 10, 19, 27, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 45, 46, 47, 55, 64, 73,
        ],
        [
            2, 11, 20, 27, 28, 30, 31, 32, 33, 34, 35, 36, 37, 38, 45, 46, 47, 56, 65, 74,
        ],
        [
            3, 12, 21, 27, 28, 29, 31, 32, 33, 34, 35, 39, 40, 41, 48, 49, 50, 57, 66, 75,
        ],
        [
            4, 13, 22, 27, 28, 29, 30, 32, 33, 34, 35, 39, 40, 41, 48, 49, 50, 58, 67, 76,
        ],
        [
            5, 14, 23, 27, 28, 29, 30, 31, 33, 34, 35, 39, 40, 41, 48, 49, 50, 59, 68, 77,
        ],
        [
            6, 15, 24, 27, 28, 29, 30, 31, 32, 34, 35, 42, 43, 44, 51, 52, 53, 60, 69, 78,
        ],
        [
            7, 16, 25, 27, 28, 29, 30, 31, 32, 33, 35, 42, 43, 44, 51, 52, 53, 61, 70, 79,
        ],
        [
            8, 17, 26, 27, 28, 29, 30, 31, 32, 33, 34, 42, 43, 44, 51, 52, 53, 62, 71, 80,
        ],
        [
            0, 9, 18, 27, 28, 29, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 54, 63, 72,
        ],
        [
            1, 10, 19, 27, 28, 29, 36, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 55, 64, 73,
        ],
        [
            2, 11, 20, 27, 28, 29, 36, 37, 39, 40, 41, 42, 43, 44, 45, 46, 47, 56, 65, 74,
        ],
        [
            3, 12, 21, 30, 31, 32, 36, 37, 38, 40, 41, 42, 43, 44, 48, 49, 50, 57, 66, 75,
        ],
        [
            4, 13, 22, 30, 31, 32, 36, 37, 38, 39, 41, 42, 43, 44, 48, 49, 50, 58, 67, 76,
        ],
        [
            5, 14, 23, 30, 31, 32, 36, 37, 38, 39, 40, 42, 43, 44, 48, 49, 50, 59, 68, 77,
        ],
        [
            6, 15, 24, 33, 34, 35, 36, 37, 38, 39, 40, 41, 43, 44, 51, 52, 53, 60, 69, 78,
        ],
        [
            7, 16, 25, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 44, 51, 52, 53, 61, 70, 79,
        ],
        [
            8, 17, 26, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 51, 52, 53, 62, 71, 80,
        ],
        [
            0, 9, 18, 27, 28, 29, 36, 37, 38, 46, 47, 48, 49, 50, 51, 52, 53, 54, 63, 72,
        ],
        [
            1, 10, 19, 27, 28, 29, 36, 37, 38, 45, 47, 48, 49, 50, 51, 52, 53, 55, 64, 73,
        ],
        [
            2, 11, 20, 27, 28, 29, 36, 37, 38, 45, 46, 48, 49, 50, 51, 52, 53, 56, 65, 74,
        ],
        [
            3, 12, 21, 30, 31, 32, 39, 40, 41, 45, 46, 47, 49, 50, 51, 52, 53, 57, 66, 75,
        ],
        [
            4, 13, 22, 30, 31, 32, 39, 40, 41, 45, 46, 47, 48, 50, 51, 52, 53, 58, 67, 76,
        ],
        [
            5, 14, 23, 30, 31, 32, 39, 40, 41, 45, 46, 47, 48, 49, 51, 52, 53, 59, 68, 77,
        ],
        [
            6, 15, 24, 33, 34, 35, 42, 43, 44, 45, 46, 47, 48, 49, 50, 52, 53, 60, 69, 78,
        ],
        [
            7, 16, 25, 33, 34, 35, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 53, 61, 70, 79,
        ],
        [
            8, 17, 26, 33, 34, 35, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 62, 71, 80,
        ],
        [
            0, 9, 18, 27, 36, 45, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 72, 73, 74,
        ],
        [
            1, 10, 19, 28, 37, 46, 54, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 72, 73, 74,
        ],
        [
            2, 11, 20, 29, 38, 47, 54, 55, 57, 58, 59, 60, 61, 62, 63, 64, 65, 72, 73, 74,
        ],
        [
            3, 12, 21, 30, 39, 48, 54, 55, 56, 58, 59, 60, 61, 62, 66, 67, 68, 75, 76, 77,
        ],
        [
            4, 13, 22, 31, 40, 49, 54, 55, 56, 57, 59, 60, 61, 62, 66, 67, 68, 75, 76, 77,
        ],
        [
            5, 14, 23, 32, 41, 50, 54, 55, 56, 57, 58, 60, 61, 62, 66, 67, 68, 75, 76, 77,
        ],
        [
            6, 15, 24, 33, 42, 51, 54, 55, 56, 57, 58, 59, 61, 62, 69, 70, 71, 78, 79, 80,
        ],
        [
            7, 16, 25, 34, 43, 52, 54, 55, 56, 57, 58, 59, 60, 62, 69, 70, 71, 78, 79, 80,
        ],
        [
            8, 17, 26, 35, 44, 53, 54, 55, 56, 57, 58, 59, 60, 61, 69, 70, 71, 78, 79, 80,
        ],
        [
            0, 9, 18, 27, 36, 45, 54, 55, 56, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
        ],
        [
            1, 10, 19, 28, 37, 46, 54, 55, 56, 63, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
        ],
        [
            2, 11, 20, 29, 38, 47, 54, 55, 56, 63, 64, 66, 67, 68, 69, 70, 71, 72, 73, 74,
        ],
        [
            3, 12, 21, 30, 39, 48, 57, 58, 59, 63, 64, 65, 67, 68, 69, 70, 71, 75, 76, 77,
        ],
        [
            4, 13, 22, 31, 40, 49, 57, 58, 59, 63, 64, 65, 66, 68, 69, 70, 71, 75, 76, 77,
        ],
        [
            5, 14, 23, 32, 41, 50, 57, 58, 59, 63, 64, 65, 66, 67, 69, 70, 71, 75, 76, 77,
        ],
        [
            6, 15, 24, 33, 42, 51, 60, 61, 62, 63, 64, 65, 66, 67, 68, 70, 71, 78, 79, 80,
        ],
        [
            7, 16, 25, 34, 43, 52, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 71, 78, 79, 80,
        ],
        [
            8, 17, 26, 35, 44, 53, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 78, 79, 80,
        ],
        [
            0, 9, 18, 27, 36, 45, 54, 55, 56, 63, 64, 65, 73, 74, 75, 76, 77, 78, 79, 80,
        ],
        [
            1, 10, 19, 28, 37, 46, 54, 55, 56, 63, 64, 65, 72, 74, 75, 76, 77, 78, 79, 80,
        ],
        [
            2, 11, 20, 29, 38, 47, 54, 55, 56, 63, 64, 65, 72, 73, 75, 76, 77, 78, 79, 80,
        ],
        [
            3, 12, 21, 30, 39, 48, 57, 58, 59, 66, 67, 68, 72, 73, 74, 76, 77, 78, 79, 80,
        ],
        [
            4, 13, 22, 31, 40, 49, 57, 58, 59, 66, 67, 68, 72, 73, 74, 75, 77, 78, 79, 80,
        ],
        [
            5, 14, 23, 32, 41, 50, 57, 58, 59, 66, 67, 68, 72, 73, 74, 75, 76, 78, 79, 80,
        ],
        [
            6, 15, 24, 33, 42, 51, 60, 61, 62, 69, 70, 71, 72, 73, 74, 75, 76, 77, 79, 80,
        ],
        [
            7, 16, 25, 34, 43, 52, 60, 61, 62, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 80,
        ],
        [
            8, 17, 26, 35, 44, 53, 60, 61, 62, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
        ],
    ],
};
