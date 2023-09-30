namespace myjinxin
{
    public class Kata
    {
        // Mask the left bit of each bit pair.
        const int mask = 0b01010101010101010101010101010101;
      
        // Swaps the bits of each pair in the number n.
        public int SwapAdjacentBits(int n) => (n & mask) << 1 | (n & ~mask) >> 1;
    }
}
