// Converts number i into i bottles(s) string.
fn bot(i: i8) -> String {
    match i {
        0 => String::from("no more bottles"),
        1 => String::from("1 bottle"),
        _ => format!("{} bottles", i),
    }
}

// constant 99 Bottles of Beer lyrics
fn beer_lyrics() -> String {
    let mut accu = String::new();
    for i in (1..=99_i8).rev() {
        accu = format!("{0}{1} of beer on the wall, {1} of beer.\nTake one down and pass it around, {2} of beer on the wall.\n", accu, bot(i), bot(i-1) );
    }
    accu.push_str("No more bottles of beer on the wall, no more bottles of beer.\n");
    accu.push_str("Go to the store and buy some more, 99 bottles of beer on the wall.");
    accu
}

// The 8kyu interpreter.
fn hq9(code: &str) -> Option<String> {
    match code {
        "H" => Some(String::from("Hello World!")),
        "Q" => Some(String::from(code)),
        "9" => Some(beer_lyrics()),
        _ => None,
    }
}
