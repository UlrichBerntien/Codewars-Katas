const NUMBERS: &[&str] = &[
    "zero",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen",
    "twenty",
];

fn wall_paper(l: f64, w: f64, h: f64) -> String {
    if l <= 0. || w <= 0. || h <= 0. {
        // error exit
        return String::from(NUMBERS[0]);
    }
    let rolls_f = (2. * l + 2. * w) * h * 1.15 / (10. * 0.52);
    let nr_rools = rolls_f.ceil() as usize;
    if nr_rools < NUMBERS.len() {
        String::from(NUMBERS[nr_rools])
    } else {
        format!("{}", nr_rools)
    }
}
