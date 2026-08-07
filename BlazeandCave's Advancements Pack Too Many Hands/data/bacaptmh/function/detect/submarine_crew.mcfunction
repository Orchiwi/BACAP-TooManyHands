# Executed as/at a player who does not hold the advancement.
# Distinct Nautiluses are counted, not riders: nothing in the reference packs establishes a
# Nautilus's passenger capacity, so three riders on one must not read as three Nautiluses.
tag @e[type=nautilus,distance=..15] remove bacaptmh_sub
execute as @a[gamemode=!spectator,distance=..15] on vehicle if entity @s[type=nautilus,distance=..15] run tag @s add bacaptmh_sub
execute store result score #f3scn bacaptmh_tmp run execute if entity @e[type=nautilus,tag=bacaptmh_sub,distance=..15]
execute if score #f3scn bacaptmh_tmp matches 3.. as @e[type=nautilus,tag=bacaptmh_sub,distance=..15] on passengers if entity @s[type=player,gamemode=!spectator] run advancement grant @s only bacaptmh:biomes/submarine_crew
tag @e[type=nautilus,distance=..15] remove bacaptmh_sub
