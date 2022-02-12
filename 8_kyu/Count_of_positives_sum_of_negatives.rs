fn count_positives_sum_negatives(input: Vec<i32>) -> Vec<i32> {
    if input.len() == 0 {
        return vec![]
    }
    let mut count = 0i32;
    let mut sum = 0i32;
    for x in input {
        if x > 0 {
            count += 1;
        } else {
            sum += x;
        }
    }
    return vec![count,sum]
}