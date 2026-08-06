# Executed as/at a candidate player. Each leader consumes one armoured wolf, so three players
# huddled around the same wolf produce exactly one leader, not three.
execute if entity @e[type=wolf,tag=bacapfel_armored,tag=!bacapfel_claimed,distance=..8] run tag @s add bacapfel_leader
execute if entity @s[tag=bacapfel_leader] as @e[type=wolf,tag=bacapfel_armored,tag=!bacapfel_claimed,distance=..8,limit=1,sort=nearest] run tag @s add bacapfel_claimed
