using System.Collections.Generic;
using System.Linq;

public class Kata
    {
        public static List<int> FilterOddNumber(List<int> listOfNumbers)
          => listOfNumbers.FindAll( it => it % 2 > 0 );
    }