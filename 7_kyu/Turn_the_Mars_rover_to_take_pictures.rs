fn turn(current: char, target: char) -> String
{
    const DIRECTIONS: &str = "NESW";
    const LEN: i32 = DIRECTIONS.len() as i32;
    let current_index = DIRECTIONS.find(current).unwrap() as i32;
    let target_index = DIRECTIONS.find(target).unwrap() as i32;
    if (current_index-target_index+LEN)%LEN > (target_index-current_index+LEN)%LEN {
        return String::from("right");
    } else {
        return String::from("left");
    }
}