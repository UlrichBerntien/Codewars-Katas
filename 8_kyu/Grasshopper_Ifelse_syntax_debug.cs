public class Player
{
  private int health = 100;

  public int Health
  {
    get => this.health;
    set
    {
      health = value;
    }
  }
  
  public Player()
  {
  }
  
  public bool CheckAlive() => this.Health > 0;
}
