# Executed as/at a player who does not hold the advancement.
# Distinct MOUNTS are counted, not riders, so piling onto one animal can never qualify.
tag @e[type=horse,distance=..15] remove bacaptmh_cav
execute as @a[gamemode=!spectator,distance=..15] on vehicle if entity @s[type=horse,distance=..15] run tag @s add bacaptmh_cav
execute store result score #f3cvn bacaptmh_tmp run execute if entity @e[type=horse,tag=bacaptmh_cav,distance=..15]
execute if score #f3cvn bacaptmh_tmp matches 4.. as @e[type=horse,tag=bacaptmh_cav,distance=..15] on passengers if entity @s[type=player,gamemode=!spectator] run advancement grant @s only bacaptmh:animal/cavalry_charge
tag @e[type=horse,distance=..15] remove bacaptmh_cav
