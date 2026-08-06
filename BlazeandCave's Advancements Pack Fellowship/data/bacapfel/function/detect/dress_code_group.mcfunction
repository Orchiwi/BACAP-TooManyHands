# Three players sharing both the armour material and the trim material, standing together
scoreboard players operation #km bacapfel_dress_m = @s bacapfel_dress_m
scoreboard players operation #kt bacapfel_dress_t = @s bacapfel_dress_t
scoreboard players set #c bacapfel_n 0
execute as @a[gamemode=!spectator,distance=..16,scores={bacapfel_dress_m=1..,bacapfel_dress_t=1..}] if score @s bacapfel_dress_m = #km bacapfel_dress_m if score @s bacapfel_dress_t = #kt bacapfel_dress_t run scoreboard players add #c bacapfel_n 1
execute if score #c bacapfel_n matches 3.. as @a[gamemode=!spectator,distance=..16,scores={bacapfel_dress_m=1..,bacapfel_dress_t=1..}] if score @s bacapfel_dress_m = #km bacapfel_dress_m if score @s bacapfel_dress_t = #kt bacapfel_dress_t run advancement grant @s only bacapfel:adventure/dress_code
