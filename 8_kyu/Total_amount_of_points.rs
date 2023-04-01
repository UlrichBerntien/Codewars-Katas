use std::error::Error;

// Calculates the total amount of points.
// Each string must be in format "a:b", invalid formated strings are ignored.
// Point system is win: 3, tie: 1, loss: 0.
fn points(games: &[String]) -> u32 {
    games
        .iter()
        .map(gameresult_from_str)
        .map(|result| match result {
            Ok(result) if result.0 > result.1 => 3,
            Ok(result) if result.0 == result.1 => 1,
            _ => 0,
        })
        .sum()
}

// Stores the result of a game like the "a:b" string.
struct GameResult(u32, u32);

// Converts a game result like "a:b" with to decimal numbers a,b int a GameResult.
fn gameresult_from_str(str: &String) -> Result<GameResult, Box<dyn Error>> {
    let parts: Vec<&str> = str.split(':').collect();
    if parts.len() != 2 {
        return Err("not a:b format".into());
    }
    Ok(GameResult(
        parts[0].parse::<u32>()?,
        parts[1].parse::<u32>()?,
    ))
}
