fn first_non_consecutive(arr: &Vec<i32>) -> Option<i32> {
    if arr.len() > 1 {
        let mut now = arr[0];
        for &it in arr {
            if now != it {return Some(it)}
            now += 1
        }
    }
    return None
}