using System;

public static class Kata
{
    // Calculates distance between first and last pillar.
    // Distance is measured between inner edges of first and last pillar.
    // num_of_pillars - Number of pillars
    // distance - Distance/m between to pillars
    // width - Width/cm of one pillar
    // Return - Total inner distance/cm
    public static int Pillars(int numPill, int dist, int width) =>
      Math.Max(0, numPill-1)*100*dist + Math.Max(0, numPill-2)*width;
}
