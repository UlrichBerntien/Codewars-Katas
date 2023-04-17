//  Calculates the number of bottles to buy with discount to finance the holiday.
//  Arguments:
//      price : normal price for 1 bottle
//      discout : discount in percent
//      holiday_cost : cost of the holiday
fn duty_free(price: i32, discount: i32, holiday_cost: i32) -> i32 {
    // go temporary to i64 to avoid overflows
    ((holiday_cost as i64 * 100) / (price as i64 * discount as i64)) as i32
}
