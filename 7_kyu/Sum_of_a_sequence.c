/**
 *  Calculates the sum of a sequence of integers.
 *  start: first number
 *  end: all numbers in the sequence must be less than or equal to end.
 *  step: step (difference) between the numbers in the sequence.
 *  return: sum or 0 on invalid arguments.
 */
unsigned sequence_sum(unsigned start, unsigned end, unsigned step)
{
    // error exit on invalid arguments
    if (end < start || step <= 0) return 0;
    // use long for intermediate calculations to avoid overflow
    // first number in the sequence
    const unsigned long first = start;
    // count of numbers in the sequence
    const unsigned long n = (end-start)/step + 1;
    // last number in sequence less than or equal to end
    const unsigned long last = first + (n-1)*step;
    // extended Gauss sum formula
    return ((first+last)*n)/2;
}
