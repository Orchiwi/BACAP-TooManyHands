# Two players in the same dye colour, in sight of each other
scoreboard players operation #k bacapfel_dye = @s bacapfel_dye
scoreboard players set #c bacapfel_n 0
execute as @a[gamemode=!spectator,distance=..16,scores={bacapfel_dye=1..}] if score @s bacapfel_dye = #k bacapfel_dye run scoreboard players add #c bacapfel_n 1
execute if score #c bacapfel_n matches 2.. as @a[gamemode=!spectator,distance=..16,scores={bacapfel_dye=1..}] if score @s bacapfel_dye = #k bacapfel_dye run advancement grant @s only bacapfel:adventure/matching_outfits
