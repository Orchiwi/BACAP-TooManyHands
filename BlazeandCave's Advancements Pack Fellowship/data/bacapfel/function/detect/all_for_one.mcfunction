# Start by assuming everybody qualifies, then knock them out one requirement at a time.
tag @a remove bacapfel_afo
tag @a remove bacapfel_afoe
tag @a[gamemode=!spectator] add bacapfel_afo
execute as @a[tag=bacapfel_afo] unless items entity @s armor.head minecraft:netherite_helmet run tag @s remove bacapfel_afo
execute as @a[tag=bacapfel_afo] unless items entity @s armor.chest minecraft:netherite_chestplate run tag @s remove bacapfel_afo
execute as @a[tag=bacapfel_afo] unless items entity @s armor.legs minecraft:netherite_leggings run tag @s remove bacapfel_afo
execute as @a[tag=bacapfel_afo] unless items entity @s armor.feet minecraft:netherite_boots run tag @s remove bacapfel_afo

# Elytra anywhere on their person
execute as @a[tag=bacapfel_afo] if items entity @s hotbar.* minecraft:elytra run tag @s add bacapfel_afoe
execute as @a[tag=bacapfel_afo] if items entity @s inventory.* minecraft:elytra run tag @s add bacapfel_afoe
execute as @a[tag=bacapfel_afo] if items entity @s weapon.offhand minecraft:elytra run tag @s add bacapfel_afoe
execute as @a[tag=bacapfel_afo,tag=!bacapfel_afoe] run tag @s remove bacapfel_afo

execute store result score #afo bacapfel_tmp4 if entity @a[tag=bacapfel_afo]
execute store result score #afot bacapfel_tmp4 if entity @a[gamemode=!spectator]
execute if score #afo bacapfel_tmp4 = #afot bacapfel_tmp4 if score #afot bacapfel_tmp4 matches 3.. run advancement grant @a[tag=bacapfel_afo] only bacapfel:challenges/all_for_one

tag @a remove bacapfel_afo
tag @a remove bacapfel_afoe
