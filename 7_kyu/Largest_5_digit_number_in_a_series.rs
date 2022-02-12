use std::str;

// Fixed sequence length given in the Kata.
const SEQUENCE_LEN: usize = 5;

fn largest_five_digit_number(num: &str) -> u32 {
    let num_bytes = num.as_bytes();
    if num_bytes.len() < SEQUENCE_LEN {
        // error exit
        return 0
    }
    let mut max_sequence = &num_bytes[0..SEQUENCE_LEN];
    for i in 1 ..= num_bytes.len()-SEQUENCE_LEN {
        let test_sequence = &num_bytes[i .. i+SEQUENCE_LEN];
        if test_sequence > max_sequence {
            max_sequence = test_sequence;
        }
    }
    str::from_utf8(max_sequence).unwrap().parse::<u32>().unwrap()
}
