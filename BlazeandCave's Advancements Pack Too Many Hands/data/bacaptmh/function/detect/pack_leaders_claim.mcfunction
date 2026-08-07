# Executed as/at a candidate player. Each leader consumes one armoured wolf, so three players
# huddled around the same wolf produce exactly one leader, not three.
execute if entity @e[type=wolf,tag=bacaptmh_armored,tag=!bacaptmh_claimed,distance=..8] run tag @s add bacaptmh_leader
execute if entity @s[tag=bacaptmh_leader] as @e[type=wolf,tag=bacaptmh_armored,tag=!bacaptmh_claimed,distance=..8,limit=1,sort=nearest] run tag @s add bacaptmh_claimed
