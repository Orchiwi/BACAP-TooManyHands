# Executed as/at a player who does not hold the advancement.
# Count distinct Happy Ghasts that are carrying somebody, not the number of riders.
tag @e[type=happy_ghast,distance=..24] remove bacapfel_fleet
execute as @a[gamemode=!spectator,gamemode=!creative,distance=..24] on vehicle if entity @s[type=happy_ghast,distance=..20] run tag @s add bacapfel_fleet
execute store result score #f3gfn bacapfel_tmp run execute if entity @e[type=happy_ghast,tag=bacapfel_fleet,distance=..20]
execute if score #f3gfn bacapfel_tmp matches 4.. as @e[type=happy_ghast,tag=bacapfel_fleet,distance=..20] on passengers if entity @s[type=player,gamemode=!spectator,gamemode=!creative] run advancement grant @s only bacapfel:nether/ghast_fleet
tag @e[type=happy_ghast,distance=..24] remove bacapfel_fleet
