fn longest_slide_down(pyramid: &[Vec<u16>]) -> u16 {
    let levels = pyramid.len();
    if levels < 1 || pyramid.iter().enumerate().any(|it| it.0 != it.1.len() - 1) {
        panic!("invalid pyramid");
    }
    let mut max_cum_sum = pyramid[levels - 1].clone();
    for level in pyramid[..levels - 1].iter().rev() {
        for i in 0..level.len() {
            max_cum_sum[i] = max_cum_sum[i].max(max_cum_sum[i + 1]) + level[i];
        }
        max_cum_sum.pop();
    }
    max_cum_sum[0]
}
