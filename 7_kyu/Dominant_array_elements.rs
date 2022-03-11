fn solve(arr: &[u32]) -> Vec<u32> {
    let mut accu = Vec::<u32>::with_capacity(arr.len());
    if arr.is_empty() {
        return accu;
    }
    let mut last = arr[arr.len() - 1];
    accu.push(last);
    for &it in arr.iter().rev() {
        if it > last {
            last = it;
            accu.push(last);
        }
    }
    accu.reverse();
    accu
}
