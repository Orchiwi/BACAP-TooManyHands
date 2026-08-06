# Everyone currently standing in the Deep Dark, with any Warden within 96 blocks voiding
# the attempt outright.
tag @a remove bacapfel_dark
execute as @a[gamemode=!spectator] at @s if biome ~ ~ ~ minecraft:deep_dark run tag @s add bacapfel_dark
execute as @a[tag=bacapfel_dark] at @s if entity @e[type=minecraft:warden,distance=..96,limit=1] run tag @s remove bacapfel_dark

# Out of the Deep Dark (or a Warden showed up) means the streak is gone.
scoreboard players set @a[tag=!bacapfel_dark] bacapfel_dd 0

execute as @a[tag=bacapfel_dark] at @s run function bacapfel:detect/sculk_silence_tick
tag @a remove bacapfel_dark
