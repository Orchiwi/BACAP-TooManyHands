# Executed as/at the Wither. It stays in the world at 0 health through its death animation.
# Counting is over every eligible player, not only those who lack the advancement, so a
# player who already has it still counts toward the three.
execute store result score #f3wihp bacapfel_tmp run data get entity @s Health 10
execute if score #f3wihp bacapfel_tmp matches 1.. run return 0
scoreboard players set #f3win bacapfel_tmp 0
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..20,nbt=!{Health:0.0f}] run scoreboard players add #f3win bacapfel_tmp 1
execute if score #f3win bacapfel_tmp matches 3.. run advancement grant @a[gamemode=!spectator,gamemode=!creative,distance=..20,nbt=!{Health:0.0f}] only bacapfel:monsters/wither_committee
