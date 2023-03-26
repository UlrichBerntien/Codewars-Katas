// Solves 5x5 Nonograms
// The clues are the sizes of the blocks in the column (top_clues) or in the row (left_clues).
// The returned 5x5 array of u8 contains a 1 for a filled cell or a 0 for an empty cell.
fn solve_nonogram((top_clues, left_clues): ([&[u8]; 5], [&[u8]; 5])) -> [[u8; 5]; 5] {
    let mut solver = NonogramSolver::new(&top_clues, &left_clues);
    if !solver.solve(0) {
        panic!("can't solve the Nonogram")
    }
    solver.get_solution()
}

// 5x5 Nonogram Solver
// Idea: 5 is very small. All possible rows/columns for each clue could be stored.
// A row/column option is stored as the lower 5 bits in an u8.
// Lowest bit in a row is the left cell, lowest bit in a column is the top cell.
#[derive(Debug, Clone)]
struct NonogramSolver {
    row_options: [Vec<u8>; 5],    // Row options
    column_options: [Vec<u8>; 5], // Column options
    row_plan: [usize; 5],         // The rows will be solved in this order
}

impl NonogramSolver {
    // Initialises a Nonogram solver by clues for columns and rows.
    fn new(top_clues: &[&[u8]; 5], left_clues: &[&[u8]; 5]) -> NonogramSolver {
        let mut solver = NonogramSolver {
            row_options: [Vec::new(), Vec::new(), Vec::new(), Vec::new(), Vec::new()],
            column_options: [Vec::new(), Vec::new(), Vec::new(), Vec::new(), Vec::new()],
            row_plan: [0, 1, 2, 3, 4],
        };
        // Convert clues to list of possible columns/rows
        for (i, clue) in top_clues.iter().enumerate() {
            solver.column_options[i].extend(OPTIONS_BY_CLUE[CompactClue::new(clue).as_index()])
        }
        for (i, clue) in left_clues.iter().enumerate() {
            solver.row_options[i].extend(OPTIONS_BY_CLUE[CompactClue::new(clue).as_index()])
        }
        // Plan the solver steps
        // Start with short number of options
        solver
            .row_plan
            .sort_by_key(|&i| solver.row_options[i].len());
        solver
    }

    // Starts/Continues solving the Nonogram at the given step.
    // Step is index in the row_plan.
    // Returns true if the Nonogram is solved.
    fn solve(&mut self, step: usize) -> bool {
        let row = self.row_plan[step];
        println!("solve row = {}", row);
        for trial in self.row_options[row].iter() {
            // Test one option in a clone of the current solver object
            let mut test_env = self.clone();
            if !test_env.reduce(row, *trial) {
                // The used row option does not match to the current available column options
                // Continue with the next row option
                continue;
            }
            if step + 1 == self.row_plan.len() || test_env.solve(step + 1) {
                // Found a solution, replace the current data set by the solution
                *self = test_env;
                return true;
            }
        }
        // No trial was successful
        false
    }

    // Reduce the options of the given row to the given trial.
    // Reduce all column options according to the trial.
    // Returns false if the trial is not possible with the available column options.
    // ATTENTION: The function modifies the options (of the one row and the columns)!
    fn reduce(&mut self, row: usize, trial: u8) -> bool {
        // Reduce the options of the selected row to one option
        assert!(self.row_options[row].contains(&trial));
        self.row_options[row].truncate(1);
        self.row_options[row][0] = trial;
        assert!(self.row_options[row].len() == 1);
        // Reduce the column options
        for (col, options) in self.column_options.iter_mut().enumerate() {
            let mut i: usize = 0;
            while i < options.len() {
                // The status (0,1) of the bit in cell row,col must be the same.
                if NonogramSolver::bit(options[i], row) == NonogramSolver::bit(trial, col) {
                    // The column option i matchs to the trial in the row
                    i += 1
                } else {
                    // The column option i does not match to the trial in the row
                    options.swap_remove(i);
                }
            }
            if options.is_empty() {
                // error exit: the trial is not possible with the current column options.
                return false;
            }
        }
        // All columns were reduce without an error
        assert!(self.column_options.iter().all(|opt| !opt.is_empty()));
        true
    }

    // Gets solution after solvind the Nongram.
    // All row options must be reduced to one option.
    fn get_solution(&self) -> [[u8; 5]; 5] {
        assert!(self.row_options.iter().all(|opt| opt.len() == 1));
        let mut grid: [[u8; 5]; 5] = [[0; 5]; 5];
        for (row_index, options) in self.row_options.iter().enumerate() {
            for col_index in 0..5 {
                grid[row_index][col_index] = NonogramSolver::bit(options[0], col_index);
            }
        }
        grid
    }

    // Returns 1 if bit index is 1 in the value, else returns 0.
    fn bit(value: u8, index: usize) -> u8 {
        if value & BIT_BY_INDEX[index] > 0 {
            1
        } else {
            0
        }
    }
}

// Compact dataformat for the clues.
// In 5x5 Nonograms maximal 3 blocks per row/colum are possibe and the block is maximal 5 units.
// Stores clues A,B,C -> 0ABC where A,B,C are sorted.
#[derive(Debug, Clone, Copy)]
struct CompactClue {
    clue: usize,
}

impl CompactClue {
    // Converts a clue to a compact clue.
    fn new(clue: &[u8]) -> CompactClue {
        let mut clue: Vec<u8> = Vec::from(clue);
        // Sort the values because the order of the values contains no information.
        clue.sort();
        // Translate the number into digits of an octal number
        CompactClue {
            clue: clue.iter().fold(0usize, |accu, &x| accu * 8 + x as usize),
        }
    }

    // Calculates clue of a row/column bit pattern.
    fn from_pattern(pattern: u8) -> CompactClue {
        let mut clue: Vec<u8> = Vec::with_capacity(3);
        let mut pattern = pattern;
        while pattern > 0 {
            pattern >>= pattern.trailing_zeros() as u8;
            clue.push(pattern.trailing_ones() as u8);
            pattern >>= clue.last().unwrap();
        }
        CompactClue::new(clue.as_slice())
    }

    // Uses a compact clue as index in an array.
    fn as_index(&self) -> usize {
        self.clue
    }
}

// Value of the bit by index.
// Index could be row index 0..5 or column index 0..5.
static BIT_BY_INDEX: [u8; 5] = [0b10000, 0b01000, 0b00100, 0b00010, 0b00001];

// Static map of all possible rows/columns per clue.
// A static map is possible because it is only a 5x5 grid.
// Index is the CompactClue
static OPTIONS_BY_CLUE: [&[u8]; 74] = [
    &[0],
    &[1, 2, 4, 8, 16],
    &[3, 6, 12, 24],
    &[7, 14, 28],
    &[15, 30],
    &[],
    &[],
    &[],
    &[],
    &[5, 9, 10, 17, 18, 20],
    &[11, 13, 19, 22, 25, 26],
    &[23, 29],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[27],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[],
    &[21],
];

// Generates the initialisation of OPTIONS_BY_CLUE.
// This function prints the source code used above.
fn options_by_clue_generator() {
    let mut options_by_clue: Vec<Vec<u8>> = Vec::new();
    // Calculate the clues for all possible row/colume patterns.
    for pattern in 0u8..0b11111 {
        let clue = CompactClue::from_pattern(pattern);
        if clue.as_index() >= options_by_clue.len() {
            options_by_clue.resize(clue.as_index() + 1, Vec::<u8>::new());
        }
        options_by_clue[clue.as_index()].push(pattern);
    }
    // Prints the source code snipet to initialise OPTIONS_BY_CLUE
    print!(
        "static OPTIONS_BY_CLUE: [&'static [u8]; {}] = [",
        options_by_clue.len()
    );
    for option in options_by_clue {
        println!("    &{:?},", option);
    }
    println!("];");
}
