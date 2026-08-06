# Counted by iteration, never by @a[limit=N], which only ever tests for one match.
scoreboard players set #cgout bacapfel_tmp4 0
execute as @a[gamemode=!spectator] at @s unless dimension minecraft:the_end run scoreboard players add #cgout bacapfel_tmp4 1
execute store result score #cgtot bacapfel_tmp4 if entity @a[gamemode=!spectator]
execute if score #cgout bacapfel_tmp4 matches 0 if score #cgtot bacapfel_tmp4 matches 3.. run advancement grant @a[gamemode=!spectator] only bacapfel:end/congregation
