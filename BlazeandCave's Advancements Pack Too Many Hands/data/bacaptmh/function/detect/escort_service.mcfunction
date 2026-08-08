# Escort Service - 500 blocks of Nether on foot, carrying nothing, guarded, untouched.
# Medium bucket, as each non-spectator non-creative player without it, at themselves.
# Every mirror used here is seeded in bacaptmh:seed, never below.
scoreboard players operation #hd bacaptmh_esc = @s bacaptmh_hurt
scoreboard players operation #hd bacaptmh_esc -= @s bacaptmh_hurtm
scoreboard players operation @s bacaptmh_hurtm = @s bacaptmh_hurt
scoreboard players operation #d bacaptmh_esc = @s bacaptmh_walk
scoreboard players operation #d bacaptmh_esc -= @s bacaptmh_walkm
scoreboard players operation @s bacaptmh_walkm = @s bacaptmh_walk
scoreboard players operation #d2 bacaptmh_esc = @s bacaptmh_sprint
scoreboard players operation #d2 bacaptmh_esc -= @s bacaptmh_sprm
scoreboard players operation @s bacaptmh_sprm = @s bacaptmh_sprint
scoreboard players operation #d bacaptmh_esc += #d2 bacaptmh_esc
# Eligibility for THIS sample. The tag is the self-exclusion for the bodyguard test.
scoreboard players set #ok bacaptmh_esc 0
tag @s add bacaptmh_esc_ward
execute if dimension minecraft:the_nether unless items entity @s armor.* * unless items entity @s hotbar.* * unless items entity @s inventory.* * unless items entity @s weapon.* * if entity @a[tag=!bacaptmh_esc_ward,gamemode=!spectator,distance=..16] run scoreboard players set #ok bacaptmh_esc 1
execute if score #hd bacaptmh_esc matches 1.. run scoreboard players set #ok bacaptmh_esc 0
execute if score #ok bacaptmh_esc matches 0 run scoreboard players set @s bacaptmh_esc 0
execute if score #ok bacaptmh_esc matches 1 if score #d bacaptmh_esc matches 0..2000 run scoreboard players operation @s bacaptmh_esc += #d bacaptmh_esc
# 50000 cm = 500 blocks. Everyone who was escorting is a participant.
execute if score @s bacaptmh_esc matches 50000.. run advancement grant @s only bacaptmh:nether/escort_service
execute if score @s bacaptmh_esc matches 50000.. run advancement grant @a[tag=!bacaptmh_esc_ward,gamemode=!spectator,distance=..16] only bacaptmh:nether/escort_service
execute if score @s bacaptmh_esc matches 50000.. run scoreboard players set @s bacaptmh_esc 0
tag @s remove bacaptmh_esc_ward
