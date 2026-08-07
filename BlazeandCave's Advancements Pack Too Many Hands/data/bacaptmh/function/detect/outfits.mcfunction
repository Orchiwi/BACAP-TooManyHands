# A8 / A9 / A10 - one live equipment read per player, then three group checks.
scoreboard players reset @a bacaptmh_dye
scoreboard players reset @a bacaptmh_dress_m
scoreboard players reset @a bacaptmh_dress_t
execute as @a[gamemode=!spectator] run function bacaptmh:detect/outfit_scan
execute if entity @a[advancements={bacaptmh:adventure/matching_outfits=false},limit=1] as @a[gamemode=!spectator,scores={bacaptmh_dye=1..}] at @s run function bacaptmh:detect/matching_outfits_group
execute if entity @a[advancements={bacaptmh:adventure/dress_code=false},limit=1] as @a[gamemode=!spectator,scores={bacaptmh_dress_m=1..,bacaptmh_dress_t=1..}] at @s run function bacaptmh:detect/dress_code_group
execute if entity @a[advancements={bacaptmh:adventure/fashion_police=false},limit=1] as @a[gamemode=!spectator,scores={bacaptmh_dress_t=1..}] at @s run function bacaptmh:detect/fashion_police_check
