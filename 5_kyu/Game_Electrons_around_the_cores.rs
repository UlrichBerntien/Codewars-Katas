fn electrons_around_the_cores(dice: Vec<u8>) -> u8 {
    const POINTS: [u8; 7] = [0, 0, 0, 2, 0, 4, 0];
    dice.iter().map(|it| POINTS[*it as usize]).sum()
}
