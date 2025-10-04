mod preloaded;
use preloaded::Player;

fn duck_duck_goose(players: &[Player], goose: u32) -> &'static str {
    if goose == 0 {
        ""
    } else {
        players[(goose - 1) as usize % players.len()].name
    }
}
