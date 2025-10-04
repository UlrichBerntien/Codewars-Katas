// Checks if player can play from hand.
// Returns true if a matching card is on the hand.
// A card matchs if color or number is the same.
fn can_play(hand: &[&str], face_up: &str) -> bool {
    let face_up_card = card_parse(face_up);
    hand.iter().any(|x| card_match(card_parse(x), face_up_card))
}

// Simple card type.
// Color and number as string slices.
type Card<'a> = (&'a str, &'a str);

// Simple "color number" scanner.
// Needs only two space separated word. No other checks.
fn card_parse<'lt>(card: &'lt str) -> Card<'lt> {
    match card.split_once(char::is_whitespace) {
        Some((color, number)) => (color, number),
        None => ("?", "?"),
    }
}

// Checks if two cards match.
// Returns true if color or number is the same.
fn card_match(a: Card, b: Card) -> bool {
    a.0 == b.0 || a.1 == b.1
}
