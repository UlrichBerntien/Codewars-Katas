// Paintfuck interpreter
// Arguments:
//      code - Program to run in Paintfuck language.
//      iterations - Maximal number of programs stepts to execute
//      width, height - Size of the 2D cell grid
// Returns:
//      Status of the cell grid after running the Paintfuck program
//      On 0 or 1 per cell, linies terminated by \r\n
pub fn interpreter(code: &str, iterations: usize, width: usize, height: usize) -> String {
    // Compile the string in enums, calculate the jump targets
    let objcode = ObjectCode::compile(code);
    // prepare empty data grid, all cells = 0
    let mut datagrid = DataGrid::new(width, height);
    // Run the program, maximal iterations
    objcode.run(&mut datagrid, iterations);
    // Return the grid status after the program run
    datagrid.to_string()
}

// ----------- DataGrid -------------------------------------------------------

// A grid of cells and a pointe rto the current cell in the grid.
struct DataGrid {
    data: Vec<bool>, // cells in flat array
    width: usize,    // size of the grid
    height: usize,
    current_row: usize, // current pointer position
    current_col: usize,
}

impl DataGrid {
    // Create new grid of size width x height.
    // Returns a grid with all cells = 0 (false).
    fn new(width: usize, height: usize) -> DataGrid {
        let n = width * height;
        // Start position of the pointer in the grid is (0,0) upper left corner
        let mut dg = DataGrid {
            data: Vec::with_capacity(n),
            width: width,
            height: height,
            current_row: 0,
            current_col: 0,
        };
        // All cells = 0 in the new grid
        dg.data.resize(n, false);
        dg
    }

    // Converts the grid content to a string.
    // Attention: Line breaks are \r\n on all systems.
    fn to_string(&self) -> String {
        let mut accu = String::with_capacity(self.height * (self.width * 3));
        for i in 0..self.data.len() {
            if i > 0 && i % self.width == 0 {
                accu.push_str("\r\n")
            }
            accu.push(if self.data[i] { '1' } else { '0' });
        }
        accu
    }

    // Reference to the current cell in the grid.
    fn current(&mut self) -> &mut bool {
        &mut self.data[self.current_row * self.width + self.current_col]
    }

    // Move current cell pointer north (up).
    // Moves pointer on a torus model of the grid.
    fn move_north(&mut self) {
        self.current_row = if self.current_row <= 0 {
            self.height - 1
        } else {
            self.current_row - 1
        }
    }

    // Moves current cell pointer east (right).
    fn move_east(&mut self) {
        self.current_col += 1;
        if self.current_col >= self.width {
            self.current_col = 0
        }
    }

    // Moves current cell pointer south (down).
    fn move_south(&mut self) {
        self.current_row += 1;
        if self.current_row >= self.height {
            self.current_row = 0
        }
    }

    // Moves current cell pointer west (left).
    fn move_west(&mut self) {
        self.current_col = if self.current_col == 0 {
            self.width - 1
        } else {
            self.current_col - 1
        }
    }

    // Flips content of the current cell.
    fn flip_current(&mut self) {
        *self.current() = !*self.current()
    }
}

// ----------- Command --------------------------------------------------------

// All commands of the Paintfuck language as enums.
// Jumps have destination address, no labels.
enum Command {
    MovePointerNorth,     // up
    MovePointerEast,      // right
    MovePointerSouth,     // down
    MovePointerWest,      // left
    FlipCurrentCell,      // same as in Smallfuck
    JumpIfZero(usize),    // jump if bit under current pointer is 0 (same as in Smallfuck)
    JumpIfNonzero(usize), // jump to the matching [ if bit under current pointer is nonzero (same as in Smallfuck)
}

// ----------- ObjectCode -----------------------------------------------------

// The object code is command enums in an array.
struct ObjectCode {
    commands: Vec<Command>,
}

impl ObjectCode {
    // Translates the Paintfuck language from string in enum array.
    // Ignores all character not part of the paintfuck language.0
    // Ignores error caused by umatched jumps "[]".
    fn compile(code: &str) -> ObjectCode {
        let mut objcode = ObjectCode {
            commands: Vec::with_capacity(code.len()),
        };
        // Stack of the last jumps to right.
        let mut last_jmp: Vec<usize> = Vec::new();
        for c in code.chars() {
            match c {
                'n' => objcode.commands.push(Command::MovePointerNorth),
                'e' => objcode.commands.push(Command::MovePointerEast),
                's' => objcode.commands.push(Command::MovePointerSouth),
                'w' => objcode.commands.push(Command::MovePointerWest),
                '*' => objcode.commands.push(Command::FlipCurrentCell),
                '[' => {
                    last_jmp.push(objcode.commands.len());
                    objcode
                        .commands
                        .push(Command::JumpIfZero(objcode.commands.len() + 1))
                }
                ']' => {
                    if let Some(back) = last_jmp.pop() {
                        objcode.commands.push(Command::JumpIfNonzero(back + 1));
                        objcode.commands[back] = Command::JumpIfZero(objcode.commands.len());
                    }
                }
                _ => {} // ignore all other characters
            }
        }
        objcode
    }

    // Runs the Paintfuck program.
    // Executes maximal max_iterations program steps.
    // Stops if program reaches the max_iterations or position at program end.
    // Returns number of excuted program steps.
    fn run(&self, grid: &mut DataGrid, max_iterations: usize) -> usize {
        let mut iterations: usize = 0;
        let mut current: usize = 0;
        while iterations < max_iterations && current < self.commands.len() {
            iterations += 1;
            current = match self.commands[current] {
                Command::MovePointerNorth => {
                    grid.move_north();
                    current + 1
                }
                Command::MovePointerEast => {
                    grid.move_east();
                    current + 1
                }
                Command::MovePointerSouth => {
                    grid.move_south();
                    current + 1
                }
                Command::MovePointerWest => {
                    grid.move_west();
                    current + 1
                }
                Command::FlipCurrentCell => {
                    grid.flip_current();
                    current + 1
                }
                Command::JumpIfZero(target) => {
                    if !*grid.current() {
                        target
                    } else {
                        current + 1
                    }
                }
                Command::JumpIfNonzero(target) => {
                    if *grid.current() {
                        target
                    } else {
                        current + 1
                    }
                }
            };
        }
        iterations
    }
}
