# Only reached while somebody's water-bucket window is open, and only for players who
# are off the ground, which is what keeps the per-tick NBT read affordable.
scoreboard players add @s bacaptmh_fall 0
execute store result score #tf bacaptmh_tmp4 run data get entity @s FallDistance 1
execute if score #tf bacaptmh_tmp4 > @s bacaptmh_fall run scoreboard players operation @s bacaptmh_fall = #tf bacaptmh_tmp4

# Splashdown: thirty blocks of drop, feet in water, and a pourer other than the faller.
tag @s add bacaptmh_faller
execute if score @s bacaptmh_fall matches 30.. if block ~ ~ ~ minecraft:water if entity @a[gamemode=!spectator,scores={bacaptmh_wt=1..},tag=!bacaptmh_faller,distance=..24,limit=1] run function bacaptmh:detect/trust_fall_hit
tag @s remove bacaptmh_faller

# ANY water clears the peak, not just touching ground. Otherwise a 30-block dive into a
# natural lake stays banked for as long as the swimmer keeps swimming.
execute if block ~ ~ ~ minecraft:water run scoreboard players set @s bacaptmh_fall 0
