// Direction of the next spiral row/column part.
#[derive(Clone,Copy)]
enum Direction {
    Right,
    Down,
    Left,
    Up,
}

// Returns the direction of the next spiral row/column part.
fn next_dir(current: Direction) -> Direction {
    match current {
        Direction::Right => Direction::Down,
        Direction::Down => Direction::Left,
        Direction::Left => Direction::Up,
        Direction::Up => Direction::Right,
    }
}

// Returns next cell in the current direction.
// Cell coordinates are tuples (x,y).
fn next_step(pos: (usize, usize), dir: Direction) -> (usize, usize) {
    match dir {
        Direction::Right => (pos.0, pos.1 + 1),
        Direction::Down => (pos.0 + 1, pos.1),
        Direction::Left => (pos.0, pos.1 - 1),
        Direction::Up => (pos.0 - 1, pos.1),
    }
}

// Check if the next cell could be used for the spiral.
// Cell coordinates are tuples (x,y).
fn next_step_ok(pos: (usize, usize), dir: Direction, field: &Vec<Vec<i8>>) -> bool {
    // Returns true if the cell is border cell.
    fn reached_limit(pos: (usize, usize), dir: Direction, last: usize) -> bool {
        match dir {
            Direction::Right if pos.1 == last => true,
            Direction::Down if pos.0 == last => true,
            Direction::Left if pos.1 == 0 => true,
            Direction::Up if pos.0 == 0 => true,
            _ => false,
        }
    }
    let last = field.len() - 1;
    // Check boarders of field.
    if reached_limit(pos, dir, last) {
        return false;
    }
    // Check distance to the next crossing spiral row/column.
    let next = next_step(pos, dir);
    if reached_limit(next, dir, last) {
        return true;
    }
    let next2 = next_step(next, dir);
    field[next2.0][next2.1] == 0
}

// Create a new empty field.
// All cells of the returned field have value 0.
fn new_field(size: usize) -> Vec<Vec<i8>> {
    let mut field = Vec::<Vec<i8>>::with_capacity(size);
    if size > 0 {
        field.push(Vec::<i8>::with_capacity(size));
        field[0].resize(size, 0);
    }
    for _ in 1..size {
        field.push(field[0].clone());
    }
    field
}

fn spiralize(size: usize) -> Vec<Vec<i8>> {
    let mut field = new_field(size);
    let mut current_pos = (0, 0);
    let mut current_dir = Direction::Right;
    let mut steps_done = 0;
    loop {
        field[current_pos.0][current_pos.1] = 1;
        steps_done += 1;
        if next_step_ok(current_pos, current_dir, &field) {
            // to next cell in the current direction.
            current_pos = next_step(current_pos, current_dir);
        } else {
            // next cell in the current direction does not exists or could not used.
            if steps_done <= 2 {
                // distance to last used row/column is too small.
                break;
            }
            // start part in the next row/column
            current_dir = next_dir(current_dir);
            steps_done = 0;
        }
    }
    field
}
