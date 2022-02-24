#[derive(Clone, Copy, Debug, PartialEq, Eq)]
enum Direction {
    North,
    East,
    West,
    South,
}

fn opposide(dir: Direction) -> Direction {
    match dir {
        Direction::North => Direction::South,
        Direction::East => Direction::West,
        Direction::West => Direction::East,
        Direction::South => Direction::North,
    }
}

fn dir_reduc(arr: &[Direction]) -> Vec<Direction> {
    let mut accu = Vec::<Direction>::with_capacity(arr.len());
    for &current in arr {
        if !accu.is_empty() && accu[accu.len() - 1] == opposide(current) {
            accu.pop();
        } else {
            accu.push(current);
        }
    }
    accu
}
