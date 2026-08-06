# The feeder is credited only if the nearest animal carries somebody else's stamp.
scoreboard players operation #cufeed bacapfel_sys = @s bacapfel_pid
tag @s add bacapfel_cu_feeder
execute as @e[type=!minecraft:player,distance=..5,sort=nearest,limit=1] if score @s bacapfel_owner matches 1.. unless score @s bacapfel_owner = #cufeed bacapfel_sys run function bacapfel:detect/custody_pay
tag @s remove bacapfel_cu_feeder
advancement revoke @s only bacapfel:adventure/shared_custody fed
