using System;
using System.Linq;

namespace Solution {
  public class Kata
  {
    // Returns the final grade of a student.
    public static int FinalGrade(int exam, int projects) =>
      (exam, projects) switch {
      (> 90, _    ) => 100,
      (_,    > 10 ) => 100,
      (> 75, >= 5 ) => 90,
      (> 50, >= 2 ) => 75,
      (_,    _    ) => 0
    };
  }
}
