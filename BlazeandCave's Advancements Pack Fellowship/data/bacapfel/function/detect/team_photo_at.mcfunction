execute store result score #k bacapfel_n if entity @a[gamemode=!spectator,distance=..3]
execute if score #k bacapfel_n matches 4.. run advancement grant @a[gamemode=!spectator,distance=..3] only bacapfel:adventure/team_photo
