# The feeder is credited only if the nearest animal carries somebody else's stamp.
scoreboard players operation #cufeed bacaptmh_sys = @s bacaptmh_pid
tag @s add bacaptmh_cu_feeder
execute as @e[type=!minecraft:player,distance=..5,sort=nearest,limit=1] if score @s bacaptmh_owner matches 1.. unless score @s bacaptmh_owner = #cufeed bacaptmh_sys run function bacaptmh:detect/custody_pay
tag @s remove bacaptmh_cu_feeder
advancement revoke @s only bacaptmh:adventure/shared_custody fed
