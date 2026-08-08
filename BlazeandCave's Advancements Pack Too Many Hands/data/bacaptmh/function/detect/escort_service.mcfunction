# Escort Service - 500 blocks of Nether on foot, carrying nothing, guarded, untouched.
# Medium bucket, as each non-spectator non-creative player without it, at themselves.
# Every mirror used here is seeded in bacaptmh:seed, never below.
# The shared scratch below is zeroed first and both copies are gated on the source
# and mirror actually being SET. `scoreboard players operation` does not run at all
# while either side is unset, and a statistic has no entry until the player first
# performs the action - so an untouched player used to inherit the delta computed
# for whoever was iterated before them in the same sweep. `matches 0..` is false on
# an unset score, which is what makes the gate work.
scoreboard players set #hd bacaptmh_esc 0
execute if score @s bacaptmh_hurt matches 0.. if score @s bacaptmh_hurtm matches 0.. run scoreboard players operation #hd bacaptmh_esc = @s bacaptmh_hurt
execute if score @s bacaptmh_hurt matches 0.. if score @s bacaptmh_hurtm matches 0.. run scoreboard players operation #hd bacaptmh_esc -= @s bacaptmh_hurtm
execute if score @s bacaptmh_hurt matches 0.. run scoreboard players operation @s bacaptmh_hurtm = @s bacaptmh_hurt
scoreboard players set #d bacaptmh_esc 0
execute if score @s bacaptmh_walk matches 0.. if score @s bacaptmh_walkm matches 0.. run scoreboard players operation #d bacaptmh_esc = @s bacaptmh_walk
execute if score @s bacaptmh_walk matches 0.. if score @s bacaptmh_walkm matches 0.. run scoreboard players operation #d bacaptmh_esc -= @s bacaptmh_walkm
execute if score @s bacaptmh_walk matches 0.. run scoreboard players operation @s bacaptmh_walkm = @s bacaptmh_walk
scoreboard players set #d2 bacaptmh_esc 0
execute if score @s bacaptmh_sprint matches 0.. if score @s bacaptmh_sprm matches 0.. run scoreboard players operation #d2 bacaptmh_esc = @s bacaptmh_sprint
execute if score @s bacaptmh_sprint matches 0.. if score @s bacaptmh_sprm matches 0.. run scoreboard players operation #d2 bacaptmh_esc -= @s bacaptmh_sprm
execute if score @s bacaptmh_sprint matches 0.. run scoreboard players operation @s bacaptmh_sprm = @s bacaptmh_sprint
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
