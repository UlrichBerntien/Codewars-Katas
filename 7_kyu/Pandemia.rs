fn infected(s: &str) -> f64 {
    let mut total: usize = 0;
    let mut infected: usize = 0;
    // sum    
    let mut continent_total: usize = 0;
    let mut continent_infected: bool = false;
    for c in s.chars() {
        if c == '0' {
            continent_total += 1;
        } else if c == '1' {
            continent_total += 1;
            continent_infected = true;
        } else if c == 'X' {
            total += continent_total;
            if continent_infected {infected += continent_total;}
            continent_total = 0;
            continent_infected = false;
        }
    }
    total += continent_total;
    if continent_infected {infected += continent_total}
    // calculate percent
    if total > 0 {100. * infected as f64 / total as f64} else {0.0}
}