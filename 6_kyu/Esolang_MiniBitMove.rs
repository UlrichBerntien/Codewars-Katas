fn interpreter(tape: &str, data: &str) -> String {
    let mut data: Vec<bool> = data.bytes().map(|it| it == b'1').collect();
    let data_last: usize = data.len() - 1;
    let mut data_index: usize = 0;
    for step in tape.bytes().cycle() {
        match step {
            b'1' => data[data_index] = !data[data_index],
            b'0' if data_index < data_last => data_index += 1,
            b'0' => break,
            _ => {}
        }
    }
    data.iter().map(|&it| if it { '1' } else { '0' }).collect()
}
