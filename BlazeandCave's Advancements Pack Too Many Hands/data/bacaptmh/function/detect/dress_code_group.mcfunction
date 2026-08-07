# Three players sharing both the armour material and the trim material, standing together
scoreboard players operation #km bacaptmh_dress_m = @s bacaptmh_dress_m
scoreboard players operation #kt bacaptmh_dress_t = @s bacaptmh_dress_t
scoreboard players set #c bacaptmh_n 0
execute as @a[gamemode=!spectator,distance=..16,scores={bacaptmh_dress_m=1..,bacaptmh_dress_t=1..}] if score @s bacaptmh_dress_m = #km bacaptmh_dress_m if score @s bacaptmh_dress_t = #kt bacaptmh_dress_t run scoreboard players add #c bacaptmh_n 1
execute if score #c bacaptmh_n matches 3.. as @a[gamemode=!spectator,distance=..16,scores={bacaptmh_dress_m=1..,bacaptmh_dress_t=1..}] if score @s bacaptmh_dress_m = #km bacaptmh_dress_m if score @s bacaptmh_dress_t = #kt bacaptmh_dress_t run advancement grant @s only bacaptmh:adventure/dress_code
