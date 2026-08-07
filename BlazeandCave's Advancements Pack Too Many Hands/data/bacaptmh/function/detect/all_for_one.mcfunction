# Start by assuming everybody qualifies, then knock them out one requirement at a time.
tag @a remove bacaptmh_afo
tag @a remove bacaptmh_afoe
tag @a[gamemode=!spectator] add bacaptmh_afo
execute as @a[tag=bacaptmh_afo] unless items entity @s armor.head minecraft:netherite_helmet run tag @s remove bacaptmh_afo
execute as @a[tag=bacaptmh_afo] unless items entity @s armor.chest minecraft:netherite_chestplate run tag @s remove bacaptmh_afo
execute as @a[tag=bacaptmh_afo] unless items entity @s armor.legs minecraft:netherite_leggings run tag @s remove bacaptmh_afo
execute as @a[tag=bacaptmh_afo] unless items entity @s armor.feet minecraft:netherite_boots run tag @s remove bacaptmh_afo

# Elytra anywhere on their person
execute as @a[tag=bacaptmh_afo] if items entity @s hotbar.* minecraft:elytra run tag @s add bacaptmh_afoe
execute as @a[tag=bacaptmh_afo] if items entity @s inventory.* minecraft:elytra run tag @s add bacaptmh_afoe
execute as @a[tag=bacaptmh_afo] if items entity @s weapon.offhand minecraft:elytra run tag @s add bacaptmh_afoe
execute as @a[tag=bacaptmh_afo,tag=!bacaptmh_afoe] run tag @s remove bacaptmh_afo

execute store result score #afo bacaptmh_tmp4 if entity @a[tag=bacaptmh_afo]
execute store result score #afot bacaptmh_tmp4 if entity @a[gamemode=!spectator]
execute if score #afo bacaptmh_tmp4 = #afot bacaptmh_tmp4 if score #afot bacaptmh_tmp4 matches 3.. run advancement grant @a[tag=bacaptmh_afo] only bacaptmh:challenges/all_for_one

tag @a remove bacaptmh_afo
tag @a remove bacaptmh_afoe
