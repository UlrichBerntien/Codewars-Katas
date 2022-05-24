fn how_many_measurements(n: u64) -> u16 {
    // Split the coins into 3 bunches A,B,C.
    // Compare weight of A and B bunches.
    //   A > B => Gold is in bunch A.
    //   A < B => Gold is in bunch B.
    //   A = B => Gold is in bunch C.
    (n as f64).log(3.).ceil() as u16
}
