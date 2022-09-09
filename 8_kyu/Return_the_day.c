// Returns name of the day.
// Returns a constant string. Do NOT free it. 
const char* whatday(const int num) {
  static const char *const name [] = {
    "Wrong, please enter a number between 1 and 7",
    "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" };
  return 1 <= num && num <= 7 ? name[num] : name[0];
}
