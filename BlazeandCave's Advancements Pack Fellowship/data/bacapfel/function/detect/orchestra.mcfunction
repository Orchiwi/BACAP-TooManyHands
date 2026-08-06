# A15 Orchestra - four players sound four different goat horns inside 5 s. A horn blast
# is read from the vanilla used:goat_horn statistic rather than from advancement criteria,
# so somebody who already holds the advancement can still play their part of the fanfare.
execute if score #timer bacapfel_horn matches 1.. run scoreboard players remove #timer bacapfel_horn 1
execute if score #timer bacapfel_horn matches 0 run function bacapfel:detect/orchestra_reset
execute as @a[gamemode=!spectator] if score @s bacapfel_ghorn > @s bacapfel_ghornp run function bacapfel:detect/orchestra_hit
execute if score #timer bacapfel_horn matches 1.. run function bacapfel:detect/orchestra_count
