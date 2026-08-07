# Two players in the same dye colour, in sight of each other
scoreboard players operation #k bacaptmh_dye = @s bacaptmh_dye
scoreboard players set #c bacaptmh_n 0
execute as @a[gamemode=!spectator,distance=..16,scores={bacaptmh_dye=1..}] if score @s bacaptmh_dye = #k bacaptmh_dye run scoreboard players add #c bacaptmh_n 1
execute if score #c bacaptmh_n matches 2.. as @a[gamemode=!spectator,distance=..16,scores={bacaptmh_dye=1..}] if score @s bacaptmh_dye = #k bacaptmh_dye run advancement grant @s only bacaptmh:adventure/matching_outfits
