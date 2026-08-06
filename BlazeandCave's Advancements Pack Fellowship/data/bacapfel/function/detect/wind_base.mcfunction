# run as a player the charge could launch: remember his height and who threw it.
# The height is read in hundredths of a block - a plain read truncates towards zero, so
# below Y=0 it would misreport the rise by up to a whole block.
execute store result score @s bacapfel_wd_base run data get entity @s Pos[1] 100
scoreboard players operation @s bacapfel_wd_from = #wdwho bacapfel_sys
scoreboard players set @s bacapfel_wd_timer 20
