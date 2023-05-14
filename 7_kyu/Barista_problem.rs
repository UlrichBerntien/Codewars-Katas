// Calculates the minimal wait time sum.
// Arguments are time units to prepare a coffee.
// 2 units are needed for cleaning between two coffee.
fn barista(coffees: &[u8]) -> u16 {
    let mut workdata: Vec<u8> = Vec::from(coffees);
    // shortest job first to reduce the totam wait time
    workdata.sort_unstable();
    let mut wait_total: u16 = 0;
    workdata
        .iter()
        .map(|&t| {
            // wait time for all coffees before and for this coffee
            let wait = wait_total + t as u16;
            // cleaning time after this coffee before next coffee
            wait_total = wait + 2;
            wait
        })
        .sum()
}
