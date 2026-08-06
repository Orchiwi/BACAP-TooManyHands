# Only reached while somebody's water-bucket window is open, and only for players who
# are off the ground, which is what keeps the per-tick NBT read affordable.
scoreboard players add @s bacapfel_fall 0
execute store result score #tf bacapfel_tmp4 run data get entity @s FallDistance 1
execute if score #tf bacapfel_tmp4 > @s bacapfel_fall run scoreboard players operation @s bacapfel_fall = #tf bacapfel_tmp4

# Splashdown: thirty blocks of drop, feet in water, and a pourer other than the faller.
tag @s add bacapfel_faller
execute if score @s bacapfel_fall matches 30.. if block ~ ~ ~ minecraft:water if entity @a[gamemode=!spectator,scores={bacapfel_wt=1..},tag=!bacapfel_faller,distance=..24,limit=1] run function bacapfel:detect/trust_fall_hit
tag @s remove bacapfel_faller

# ANY water clears the peak, not just touching ground. Otherwise a 30-block dive into a
# natural lake stays banked for as long as the swimmer keeps swimming.
execute if block ~ ~ ~ minecraft:water run scoreboard players set @s bacapfel_fall 0
