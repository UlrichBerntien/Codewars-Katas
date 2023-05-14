// Returns result of Rock, Paper, Scirrors game.
// Arguments p1, p2 must be lower case strings.
fn rps(p1: &str, p2: &str) -> &'static str {
    match (p1, p2) {
        (SCISSORS, PAPER) | (PAPER, ROCK) | (ROCK, SCISSORS) => PLAYER1,
        (PAPER, SCISSORS) | (ROCK, PAPER) | (SCISSORS, ROCK) => PLAYER2,
        _ => DRAW,
    }
}

// Possible hand forms
const SCISSORS: &str = "scissors";
const ROCK: &str = "rock";
const PAPER: &str = "paper";

// Possible results
const PLAYER1: &str = "Player 1 won!";
const PLAYER2: &str = "Player 2 won!";
const DRAW: &str = "Draw!";
