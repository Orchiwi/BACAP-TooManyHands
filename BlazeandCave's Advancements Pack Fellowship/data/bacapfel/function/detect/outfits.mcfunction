# A8 / A9 / A10 - one live equipment read per player, then three group checks.
scoreboard players reset @a bacapfel_dye
scoreboard players reset @a bacapfel_dress_m
scoreboard players reset @a bacapfel_dress_t
execute as @a[gamemode=!spectator] run function bacapfel:detect/outfit_scan
execute if entity @a[advancements={bacapfel:adventure/matching_outfits=false},limit=1] as @a[gamemode=!spectator,scores={bacapfel_dye=1..}] at @s run function bacapfel:detect/matching_outfits_group
execute if entity @a[advancements={bacapfel:adventure/dress_code=false},limit=1] as @a[gamemode=!spectator,scores={bacapfel_dress_m=1..,bacapfel_dress_t=1..}] at @s run function bacapfel:detect/dress_code_group
execute if entity @a[advancements={bacapfel:adventure/fashion_police=false},limit=1] as @a[gamemode=!spectator,scores={bacapfel_dress_t=1..}] at @s run function bacapfel:detect/fashion_police_check
