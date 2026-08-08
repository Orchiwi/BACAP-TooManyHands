# Executed as and at a survival player who does not hold Air Rescue, every tick, and
# ONLY while a Happy Ghast is within 24 blocks - that gate is what makes a per-tick NBT
# read affordable, the same trick detect/trust_fall uses.
# #ar_fd is reset first: if the NBT path ever fails, a stale value must not leak
# from the previous player in the loop.
scoreboard players add @s bacaptmh_arw 0
scoreboard players set #ar_fd bacaptmh_ar 0
execute store result score #ar_fd bacaptmh_ar run data get entity @s FallDistance 1
execute if score #ar_fd bacaptmh_ar matches 50.. run scoreboard players set @s bacaptmh_arw 100
execute if score @s bacaptmh_arw matches 1.. run scoreboard players remove @s bacaptmh_arw 1
# Caught: the window is open, the fall has stopped, the faller is alive, and a Happy
# Ghast beside him carries a player who is not the faller himself.
tag @s add bacaptmh_ar_self
scoreboard players set #ar_pilot bacaptmh_ar 0
execute if score @s bacaptmh_arw matches 1.. if score #ar_fd bacaptmh_ar matches ..1 if entity @s[nbt=!{Health:0.0f}] as @e[type=happy_ghast,distance=..6,limit=1,sort=nearest] on passengers if entity @s[type=player,tag=!bacaptmh_ar_self] run scoreboard players add #ar_pilot bacaptmh_ar 1
execute if score #ar_pilot bacaptmh_ar matches 1.. run advancement grant @s only bacaptmh:nether/air_rescue
execute if score #ar_pilot bacaptmh_ar matches 1.. run scoreboard players set @s bacaptmh_arw 0
execute if score #ar_pilot bacaptmh_ar matches 1.. as @e[type=happy_ghast,distance=..6,limit=1,sort=nearest] on passengers run advancement grant @s[type=player] only bacaptmh:nether/air_rescue
tag @s remove bacaptmh_ar_self
