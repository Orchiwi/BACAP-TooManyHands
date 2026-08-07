# A15 Orchestra - four players sound four different goat horns inside 5 s. A horn blast
# is read from the vanilla used:goat_horn statistic rather than from advancement criteria,
# so somebody who already holds the advancement can still play their part of the fanfare.
execute if score #timer bacaptmh_horn matches 1.. run scoreboard players remove #timer bacaptmh_horn 1
execute if score #timer bacaptmh_horn matches 0 run function bacaptmh:detect/orchestra_reset
execute as @a[gamemode=!spectator] if score @s bacaptmh_ghorn > @s bacaptmh_ghornp run function bacaptmh:detect/orchestra_hit
execute if score #timer bacaptmh_horn matches 1.. run function bacaptmh:detect/orchestra_count
