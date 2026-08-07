# Everyone currently standing in the Deep Dark, with any Warden within 96 blocks voiding
# the attempt outright.
tag @a remove bacaptmh_dark
execute as @a[gamemode=!spectator] at @s if biome ~ ~ ~ minecraft:deep_dark run tag @s add bacaptmh_dark
execute as @a[tag=bacaptmh_dark] at @s if entity @e[type=minecraft:warden,distance=..96,limit=1] run tag @s remove bacaptmh_dark

# Out of the Deep Dark (or a Warden showed up) means the streak is gone.
scoreboard players set @a[tag=!bacaptmh_dark] bacaptmh_dd 0

execute as @a[tag=bacaptmh_dark] at @s run function bacaptmh:detect/sculk_silence_tick
tag @a remove bacaptmh_dark
