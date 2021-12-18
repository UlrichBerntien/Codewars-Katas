using System;

public static class Kata
{
  public static int GetParticipants(int handshakes)
    => (int) Math.Ceiling(Math.Sqrt(2 * handshakes + .25) + .5);
}