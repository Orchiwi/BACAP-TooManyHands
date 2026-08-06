# A6 Team Photo - four players inside a three-block radius
execute store result score #n bacapfel_n if entity @a[gamemode=!spectator]
execute if score #n bacapfel_n matches ..3 run return 0
execute as @a[gamemode=!spectator,advancements={bacapfel:adventure/team_photo=false}] at @s run function bacapfel:detect/team_photo_at
