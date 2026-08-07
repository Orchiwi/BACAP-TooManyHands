# run as one trader, at him: is there a second trader close enough for it to have been
# each other? The flags are kept for every player, so a partner who already holds the
# advancement still counts and nobody can be locked out of it.
tag @s add bacaptmh_mad_self
execute if entity @a[tag=!bacaptmh_mad_self,scores={bacaptmh_ekill=1..,bacaptmh_edeath=1..},distance=..64] as @s[gamemode=!spectator,advancements={bacaptmh:weaponry/mutually_assured_destruction=false}] run advancement grant @s only bacaptmh:weaponry/mutually_assured_destruction
tag @s remove bacaptmh_mad_self
