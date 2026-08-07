# A6 Team Photo - four players inside a three-block radius
execute store result score #n bacaptmh_n if entity @a[gamemode=!spectator]
execute if score #n bacaptmh_n matches ..3 run return 0
execute as @a[gamemode=!spectator,advancements={bacaptmh:adventure/team_photo=false}] at @s run function bacaptmh:detect/team_photo_at
