fn solve(arr: &[u32; 3]) -> u32 {
    let max_pile: u32 = *arr.iter().max().unwrap();
    let sum_piles: u32 = arr.iter().sum::<u32>();
    let sum_other_piles: u32 = sum_piles - max_pile;
    if sum_other_piles < max_pile {
        sum_other_piles
    } else {
        sum_piles / 2
    }
}
