// Returns value of the first digit in the word.
fn index(word: &str) -> usize {
    let digit = word.chars().find(|&c| c.is_numeric());
    match digit {
        None => 0,
        Some(d) => d as usize - '0' as usize,
    }
}

fn order(sentence: &str) -> String {
    let mut accu: [&str; 10] = [""; 10];
    let mut n = 0;
    for word in sentence.split(' ') {
        let i = index(word);
        if n < i {
            n = i;
        }
        accu[i] = word;
    }
    accu[1..=n].join(" ")
}
