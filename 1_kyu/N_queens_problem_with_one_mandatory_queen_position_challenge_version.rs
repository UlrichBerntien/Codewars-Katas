use rand::seq::SliceRandom;
use std::fmt;

// Information block of a queen.
// Position of the queen and effective blocked diagonales by the queen.
// The info block is stored in an array with index = row index of the queen.
// Each queen has a assigned row in this program code.
#[derive(Clone)]
struct Queen {
    is_mandatory: bool, // true means, queen is mandatory set on the board
    col: usize,         // column position of the queen
    diag_left: usize,   // left diagonal id
    diag_right: usize,  // right diagonal id
}

// Information of the board with the queens.
#[derive(Clone)]
struct Board {
    size: usize,               // number of rows = number of columns = number of queens
    last_n: usize,             // = size-1 = index of last row or last column
    queen: Vec<Queen>,         // information of each queen, row index = index of queen
    n_on_col: Vec<u16>,        // number of queens on the column
    n_on_diag_left: Vec<u16>,  // number of queens on the right diagonal
    n_on_diag_right: Vec<u16>, // number of queens in the left diagonal
    error_count: usize, // number of invalid placed queen, ONLY valid after update_error called.
}

impl Board {
    // New empty board of given size
    fn new(size: usize) -> Board {
        let mut result = Board {
            size,
            last_n: size - 1,
            queen: Vec::with_capacity(size),
            n_on_col: Vec::with_capacity(size),
            n_on_diag_left: Vec::with_capacity(2 * size),
            n_on_diag_right: Vec::with_capacity(2 * size),
            error_count: 0,
        };
        result.queen.resize(
            size,
            Queen {
                is_mandatory: false,
                col: 0,
                diag_left: 0,
                diag_right: 0,
            },
        );
        result.n_on_col.resize(size, 0);
        result.n_on_diag_left.resize(2 * size, 0);
        result.n_on_diag_right.resize(2 * size, 0);
        result
    }

    // Calculate the left diagonal index of the queen.
    // The left diagonal index is the same for each queen on a left diagonal.
    #[inline(always)]
    const fn diag_left(&self, row: usize, col: usize) -> usize {
        self.last_n + col - row
    }

    // Calculate the right diagonal index of the queen.
    // The right diagonal index is the same for each queen on a right diagonal.
    #[inline(always)]
    const fn diag_right(&self, row: usize, col: usize) -> usize {
        col + row
    }

    // Sum effects on the cell.
    // A queen effects in the columne, left diagonale, right diagonale.
    // The effect in the row is not summed because the algorithm placed only one queen per row.
    // A cell with no queen and no other queen on the same column or diagonal has effect = 0.
    // A cell with a queen and no other queen on the same column or diagonal has effect = 3.
    // A cell with a queen and other queens on the same column or diagonal has effect > 3.
    #[inline(always)]
    fn effect_on_cell(&self, row: usize, col: usize) -> u16 {
        assert!((0..self.size).contains(&row));
        assert!((0..self.size).contains(&col));
        let diag_left = self.diag_left(row, col);
        let diag_right = self.diag_right(row, col);
        self.n_on_col[col] + self.n_on_diag_left[diag_left] + self.n_on_diag_right[diag_right]
    }

    // Checks if the queen in row is on good position.
    // Returns true if no other queen is on the same column or diagonale.
    #[inline(always)]
    fn queen_position_ok(&self, row: usize) -> bool {
        assert!((0..self.size).contains(&row));
        assert!(self.effect_on_cell(row, self.queen[row].col) >= 3);
        self.effect_on_cell(row, self.queen[row].col) == 3
    }

    // Updates the error_count of the board.
    // Returns the error count, number of invalid placed queens.
    fn update_error(&mut self) {
        self.error_count = (0..self.size)
            .filter(|&row| !self.queen_position_ok(row))
            .count();
    }

    // Sets a queen on the board.
    fn set_queen(&mut self, row: usize, col: usize) {
        assert!((0..self.size).contains(&row));
        assert!((0..self.size).contains(&col));
        // Update the queen information block.
        let diag_left = self.diag_left(row, col);
        let diag_right = self.diag_right(row, col);
        let mut the_queen = &mut self.queen[row];
        the_queen.col = col;
        the_queen.diag_left = diag_left;
        the_queen.diag_right = diag_right;
        // Update the board.
        self.n_on_col[col] += 1;
        self.n_on_diag_left[diag_left] += 1;
        self.n_on_diag_right[diag_right] += 1;
        assert!(self.effect_on_cell(row, col) >= 3)
    }

    // Sets a queen mandatory on the board.
    fn set_mandatory_queen(&mut self, row: usize, col: usize) {
        assert!((0..self.size).contains(&row));
        assert!((0..self.size).contains(&col));
        self.set_queen(row, col);
        self.queen[row].is_mandatory = true;
    }

    // Removes a queen from the board.
    fn remove_queen(&mut self, row: usize) {
        assert!((0..self.size).contains(&row));
        // No update of the queen information block.
        // The last column, diagonal ids remains in the information block.
        let the_queen = &mut self.queen[row];
        assert!((0..self.size).contains(&the_queen.col));
        // Update the board.
        self.n_on_col[the_queen.col] -= 1;
        self.n_on_diag_left[the_queen.diag_left] -= 1;
        self.n_on_diag_right[the_queen.diag_right] -= 1;
    }

    // A local search of minimal effects on one queen by all other queens.
    // A local Hill-climbing search to find the local minimum by moving one queen in the row.
    // Problem is solved if no effects on any queen from all other queens is reached.
    fn local_optimize(&mut self) {
        let mut ok = false;
        let mut moved = true;
        while !ok && moved {
            ok = true;
            moved = false;
            for row in 0..self.size {
                let current_col = self.queen[row].col;
                let current_effect = self.effect_on_cell(row, current_col);
                if current_effect > 3 {
                    // current cell of the queen has effect of another queen
                    ok = false;
                    if !self.queen[row].is_mandatory {
                        // Only move the not mandatory set queens
                        // Search best position for the queen
                        // Column with minimal number effects of other queens
                        let mut min_col = current_col;
                        // Start with the effect of the other queens on the current position
                        let mut min_effect = current_effect - 3;
                        // Search position with less queens have effect on the cell.
                        for col in 0..self.size {
                            let e = self.effect_on_cell(row, col);
                            if e < min_effect {
                                min_effect = e;
                                min_col = col;
                            }
                        }
                        if min_col != current_col {
                            // better column was found
                            moved = true;
                            self.remove_queen(row);
                            self.set_queen(row, min_col);
                        }
                    }
                }
            }
        }
        self.update_error();
    }

    // Try to escape a local minimum by random jumps of invalid positioned queens.
    fn random_jumps(&mut self) {
        let mut cols: Vec<usize> = (0..self.size).collect();
        cols.shuffle(&mut rand::thread_rng());
        for row in 0..self.size {
            let the_queen = &self.queen[row];
            if !the_queen.is_mandatory && !self.queen_position_ok(row) {
                // This queen is not mandatory set. So can be placed at another column.
                // And this queen has another queen on the column or the diagonals.
                self.remove_queen(row);
                self.set_queen(row, cols.pop().unwrap());
            }
        }
    }

    // Try to escape a local minimum by random positions of all the queens.
    fn random_positions(&mut self) {
        let mut cols: Vec<usize> = (0..self.size).collect();
        cols.shuffle(&mut rand::thread_rng());
        for row in 0..self.size {
            let the_queen = &self.queen[row];
            if !the_queen.is_mandatory {
                // This queen is not mandatory set. So can be placed at another column.
                // And this queen has another queen on the column or the diagonals.
                self.remove_queen(row);
                self.set_queen(row, cols.pop().unwrap());
            }
        }
    }

    // Set all the not mandatory queens on the board.
    // Start with a queen on field
    // Djamel: "Efficient optimization to the N Queens Problem"
    // https://dspace.univ-ouargla.dz/jspui/bitstream/123456789/20860/1/Hadj%20Mohammed%20Djamel.pdf
    fn set_initial(&mut self, row_start: usize, col_start: usize) {
        for i in 0..self.size {
            let row = (row_start + i) % self.size;
            if !self.queen[row].is_mandatory {
                let col = (col_start + i * 2) % self.size;
                self.set_queen(row, col);
            }
        }
        self.update_error();
    }
}

impl fmt::Display for Board {
    // Write the board row by row. Each row in a line with line feed.
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        let mut line: Vec<u8> = Vec::with_capacity(self.size);
        line.resize(self.size, b'.');
        for row in 0..self.size {
            line[self.queen[row].col] = b'Q';
            if let Ok(s) = std::str::from_utf8(&line) {
                let ret = writeln!(f, "{}", s);
                if let Err(msg) = ret {
                    panic!("{:#?}", msg);
                }
            }
            line[self.queen[row].col] = b'.';
        }
        Ok(())
    }
}

pub fn solve_n_queens(n: usize, mandatory_coords: (usize, usize)) -> Option<String> {
    const N_BOARDS: usize = 8; // number of boards to keep
    const MAX_ITERATIONS: usize = 200_000;
    let mut boards: Vec<Board> = Vec::with_capacity(N_BOARDS * 2);
    {
        // Generate the first board.
        let mut work = Board::new(n);
        work.set_mandatory_queen(mandatory_coords.1, mandatory_coords.0);
        work.set_initial(mandatory_coords.1, mandatory_coords.0);
        work.local_optimize();
        boards.push(work);
    }
    let mut count = MAX_ITERATIONS;
    while boards[0].error_count > 0 && count > 0 {
        count -= 1;
        while boards.len() > N_BOARDS {
            boards.pop();
        }
        // Try to jump out of the local minimum into a better minimum.
        // Try each stored board.
        for base in 0..boards.len() {
            let mut new_board = boards[base].clone();
            new_board.random_jumps();
            new_board.local_optimize();
            if new_board.error_count < boards[boards.len() - 1].error_count {
                boards.push(new_board);
            }
        }
        if boards.len() == N_BOARDS {
            // The jumps of invalid positioned queens are not enough.
            // Try a total new random generated board.
            let mut new_board = boards[0].clone();
            new_board.random_positions();
            new_board.local_optimize();
            boards.push(new_board);
        }
        boards.sort_unstable_by(|a, b| a.error_count.cmp(&b.error_count));
    }
    if boards[0].error_count == 0 {
        Some(boards[0].to_string())
    } else {
        None
    }
}
