const CATEGORY_OPEN: &str = "Open";
const CATEGORY_SENIOR: &str = "Senior";

fn open_or_senior(data: Vec<(i32, i32)>) -> Vec<&'static str> {
    let mut category = Vec::<&str>::with_capacity(data.len());
    for (age,handicap) in data {
        let cat = if age >= 55 && handicap > 7 {CATEGORY_SENIOR} else {CATEGORY_OPEN};
        category.push(cat);
    }
    return category
}