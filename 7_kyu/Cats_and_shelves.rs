// Calculates number of jumps from start to finish.
pub fn cats_and_shelves(start: u8, finish: u8) -> u8 {
  if finish < start {
    panic!("argument error: finish < start");
  }
  let delta = finish - start;
  // Cat can jump over one shelf "/3" but must go the last steps "delta %3"
  delta / 3 + delta % 3
}
