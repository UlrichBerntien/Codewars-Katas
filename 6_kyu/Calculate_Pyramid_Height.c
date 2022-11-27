// Calculates maximal height of a pyramid builded with up to n blocks.
// Number of blocks per layer is h*h.
unsigned int pyramid_height(unsigned n) {
  unsigned next_height = 1;
  unsigned blocks_needed;
  while( (blocks_needed = next_height*next_height) <= n ) {
    n -= blocks_needed;
    ++next_height;
  }
  return --next_height;
}
