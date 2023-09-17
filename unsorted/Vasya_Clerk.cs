using System;

public class Line
    {
        private const string yes = "YES";
        private const string no = "NO";
  
        public static string Tickets(int[] peopleInLine)
        { 
            int box100 = 0;
            int box50 = 0;
            int box25 = 0;
            foreach (int invalue in peopleInLine)
                switch (invalue) {
                case 25:
                    box25++;
                    break;
                case 50:
                    box50++;
                    if (box25 > 0)
                        box25--;
                    else
                        return no;
                    break;
                case 100:
                    box100++;
                    if (box50 > 0 && box25 > 0)
                        {box50--; box25--;}
                    else if (box25 > 2)
                        box25 -= 3;
                    else
                        return no;
                    break;
                default:
                    return no;
              }
          return yes;
        }
    }
