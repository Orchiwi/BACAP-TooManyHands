# run as one trader, at him: is there a second trader close enough for it to have been
# each other? The flags are kept for every player, so a partner who already holds the
# advancement still counts and nobody can be locked out of it.
tag @s add bacapfel_mad_self
execute if entity @a[tag=!bacapfel_mad_self,scores={bacapfel_ekill=1..,bacapfel_edeath=1..},distance=..64] as @s[gamemode=!spectator,advancements={bacapfel:weaponry/mutually_assured_destruction=false}] run advancement grant @s only bacapfel:weaponry/mutually_assured_destruction
tag @s remove bacapfel_mad_self
