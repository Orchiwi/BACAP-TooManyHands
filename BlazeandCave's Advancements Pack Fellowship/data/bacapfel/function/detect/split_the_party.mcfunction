# A5 Split the Party - one player in each of the three dimensions at the same moment.
# Exactly one player per dimension is tagged, so bystanders get nothing.
execute store result score #n bacapfel_n if entity @a[gamemode=!spectator]
execute if score #n bacapfel_n matches ..2 run return 0
scoreboard players set #ow bacapfel_n 0
scoreboard players set #ne bacapfel_n 0
scoreboard players set #en bacapfel_n 0
tag @a remove bacapfel_dim
execute as @a[gamemode=!spectator] at @s if dimension minecraft:overworld run function bacapfel:detect/split_mark {d:"ow"}
execute as @a[gamemode=!spectator] at @s if dimension minecraft:the_nether run function bacapfel:detect/split_mark {d:"ne"}
execute as @a[gamemode=!spectator] at @s if dimension minecraft:the_end run function bacapfel:detect/split_mark {d:"en"}
execute if score #ow bacapfel_n matches 1 if score #ne bacapfel_n matches 1 if score #en bacapfel_n matches 1 run advancement grant @a[tag=bacapfel_dim] only bacapfel:adventure/split_the_party
tag @a remove bacapfel_dim
