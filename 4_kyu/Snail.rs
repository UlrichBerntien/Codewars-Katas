enum Direction {
    Right,
    Down,
    Left,
    Up,
}

fn snail(matrix: &[Vec<i32>]) -> Vec<i32> {
    if matrix.is_empty() || matrix[0].is_empty() {
        return Vec::new();
    }
    // current fist and last column, y-axis
    let mut y0 = 0usize;
    let mut yn = matrix.len() - 1;
    // current first and last row, x-axis
    let mut x0 = 0usize;
    let mut xn = matrix[0].len() - 1;
    // Prepare vector to contain all items
    let n = (xn + 1) * (yn + 1);
    let mut accu = Vec::with_capacity(n);
    // current direction
    let mut mv = Direction::Right;
    // current position
    let mut x = 0;
    let mut y = 0;
    while accu.len() < n {
        accu.push(matrix[y][x]);
        match mv {
            Direction::Right => {
                if x == xn {
                    mv = Direction::Down;
                    y += 1;
                    y0 += 1;
                } else {
                    x += 1;
                }
            }
            Direction::Down => {
                if y == yn {
                    mv = Direction::Left;
                    x -= 1;
                    xn -= 1;
                } else {
                    y += 1;
                }
            }
            Direction::Left => {
                if x == x0 {
                    mv = Direction::Up;
                    y -= 1;
                    yn -= 1;
                } else {
                    x -= 1;
                }
            }
            Direction::Up => {
                if y == y0 {
                    mv = Direction::Right;
                    x += 1;
                    x0 += 1;
                } else {
                    y -= 1;
                }
            }
        }
    }
    accu
}
