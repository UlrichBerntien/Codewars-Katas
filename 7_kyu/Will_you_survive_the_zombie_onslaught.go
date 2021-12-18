package kata
import "fmt"

func Zombie_shootout(zombies, initial_range, ammo int) string {
    time_shot_all := zombies
    time_eaten := 2 * initial_range
    time_out_ammo := ammo
    switch {
    case time_eaten < time_shot_all && time_eaten <= time_out_ammo :
        return fmt.Sprintf( "You shot %d zombies before being eaten: overwhelmed.", time_eaten )
    case time_out_ammo < time_shot_all && time_out_ammo < time_eaten:
        return fmt.Sprintf( "You shot %d zombies before being eaten: ran out of ammo.", time_out_ammo )
    default:
        return fmt.Sprintf( "You shot all %d zombies.", zombies )
    }
}