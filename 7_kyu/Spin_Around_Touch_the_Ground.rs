fn spin_around(lst: &[&str]) -> u32 {
    let total_spins = lst.iter().fold(0i32, |sum,rot| if *rot == "right" {sum+1} else {sum-1} );
    ( total_spins.abs() / 4 ) as u32
}
