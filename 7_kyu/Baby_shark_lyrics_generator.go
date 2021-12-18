package kata
import"strings"
func BabySharkLyrics()string{
t:="B,B,B,B!M,M,M,M!D,D,D,D!Gm,Gm,Gm,Gm!Gp,Gp,Gp,Gp!L,L,L,L!R"
for _,R:=range strings.Split(`!
$Ds$ma$pa$a s$, d d d d d d
$Run away,…
$doo$Baby s$Mommy s$shark$Grand$Daddy $Let's go hunt`,"$"){t=strings.ReplaceAll(t,R[:1],R)}
return t}