# Executed as/at a player who does not hold the advancement.
# One radius for the wolf search and its clears (24), one for the qualifying players (10),
# one for a player's own wolf (8). Wolf Armor can only be worn by a tamed wolf, so the armour
# test is also the tamed test.
tag @a[tag=bacaptmh_leader] remove bacaptmh_leader
tag @e[type=wolf,tag=bacaptmh_armored,distance=..24] remove bacaptmh_armored
tag @e[type=wolf,tag=bacaptmh_claimed,distance=..24] remove bacaptmh_claimed
execute as @e[type=wolf,distance=..24] if items entity @s armor.body minecraft:wolf_armor run tag @s add bacaptmh_armored
execute as @a[gamemode=!spectator,distance=..10] at @s run function bacaptmh:detect/pack_leaders_claim
execute store result score #f3pln bacaptmh_tmp run execute if entity @a[tag=bacaptmh_leader]
execute if score #f3pln bacaptmh_tmp matches 3.. run advancement grant @a[tag=bacaptmh_leader] only bacaptmh:animal/pack_leaders
tag @a[tag=bacaptmh_leader] remove bacaptmh_leader
tag @e[type=wolf,tag=bacaptmh_armored,distance=..24] remove bacaptmh_armored
tag @e[type=wolf,tag=bacaptmh_claimed,distance=..24] remove bacaptmh_claimed
