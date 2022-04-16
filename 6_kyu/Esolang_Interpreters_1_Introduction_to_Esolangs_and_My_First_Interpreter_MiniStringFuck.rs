fn my_first_interpreter(code: &str) -> String {
    let mut output = String::new();
    let mut accu = 0_u8;
    for c in code.chars() {
        match c {
            '+' => accu = accu.wrapping_add(1),
            '.' => output.push(accu as char),
            _ => {} // ignore invalid code
        }
    }
    output
}
