fn can_escape(walls: &[(usize, usize)]) -> bool {
    walls
        .iter()
        .enumerate()
        .all(|(i, wall)| wall.0 > i + 1 && wall.1 > i + 1)
}
