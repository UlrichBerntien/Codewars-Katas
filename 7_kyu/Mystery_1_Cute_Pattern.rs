use lazy_static::lazy_static;
use regex::Regex;

// Returns true if the titles contains a 2x2 block of white of black cells.
// The tiles contains a 4x4 grid, each row separated by one \n character.
fn cute_pattern(tiles: &str) -> bool {
    lazy_static! {
        static ref BLOCK: Regex = Regex::new(r"(?s)(WW...WW)|(BB...BB)").unwrap();
    }
    !BLOCK.is_match(tiles)
}
