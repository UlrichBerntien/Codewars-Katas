public class Kata
{
    public static string Shark(
      int pontoonDistance, 
      int sharkDistance, 
      int yourSpeed, 
      int sharkSpeed, 
      bool dolphin)
    {
      if (dolphin)
        sharkSpeed /= 2;
      bool alive = pontoonDistance * sharkSpeed < sharkDistance * yourSpeed;
      return alive ? "Alive!" : "Shark Bait!";
    }
}