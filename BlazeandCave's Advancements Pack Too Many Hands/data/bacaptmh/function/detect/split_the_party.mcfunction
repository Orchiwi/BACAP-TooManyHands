# A5 Split the Party - one player in each of the three dimensions at the same moment.
# Exactly one player per dimension is tagged, so bystanders get nothing.
execute store result score #n bacaptmh_n if entity @a[gamemode=!spectator]
execute if score #n bacaptmh_n matches ..2 run return 0
scoreboard players set #ow bacaptmh_n 0
scoreboard players set #ne bacaptmh_n 0
scoreboard players set #en bacaptmh_n 0
tag @a remove bacaptmh_dim
execute as @a[gamemode=!spectator] at @s if dimension minecraft:overworld run function bacaptmh:detect/split_mark {d:"ow"}
execute as @a[gamemode=!spectator] at @s if dimension minecraft:the_nether run function bacaptmh:detect/split_mark {d:"ne"}
execute as @a[gamemode=!spectator] at @s if dimension minecraft:the_end run function bacaptmh:detect/split_mark {d:"en"}
execute if score #ow bacaptmh_n matches 1 if score #ne bacaptmh_n matches 1 if score #en bacaptmh_n matches 1 run advancement grant @a[tag=bacaptmh_dim] only bacaptmh:adventure/split_the_party
tag @a remove bacaptmh_dim
