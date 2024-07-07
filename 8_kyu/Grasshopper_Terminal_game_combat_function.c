int combat(int health, int damage) {
  return health > damage ? health - damage : 0;
}
