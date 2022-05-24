fn shortest_steps_to_num(n: u16) -> u16 {
    let mut counter = 0;
    let mut remain = n;
    while remain > 1 {
        if remain & 1 > 0 {
            counter += 1;
        }
        counter += 1;
        remain /= 2;
    }
    counter
}
