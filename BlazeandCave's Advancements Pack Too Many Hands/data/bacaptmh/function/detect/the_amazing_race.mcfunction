# The Amazing Race - executed as/at every survival player every slow tick while somebody
# still lacks it. Standing with another player re-plants the start line at your feet, but
# only while your best is still short of the distance, so meeting again at the finish
# cannot wipe the run.
execute unless score @s bacaptmh_armax matches 25000000.. if entity @a[gamemode=!spectator,distance=0.1..3,limit=1] store result score @s bacaptmh_arx run data get entity @s Pos[0]
execute unless score @s bacaptmh_armax matches 25000000.. if entity @a[gamemode=!spectator,distance=0.1..3,limit=1] store result score @s bacaptmh_arz run data get entity @s Pos[2]
execute unless score @s bacaptmh_armax matches 25000000.. if entity @a[gamemode=!spectator,distance=0.1..3,limit=1] run scoreboard players set @s bacaptmh_armax 0
execute unless score @s bacaptmh_arx matches -2147483648..2147483647 run return 0
# Squared horizontal distance from the start line. Both axis deltas are clamped to 6000
# before squaring, so the multiply cannot overflow a 32-bit score.
execute store result score #ar_dx bacaptmh_tmp run data get entity @s Pos[0]
execute store result score #ar_dz bacaptmh_tmp run data get entity @s Pos[2]
scoreboard players operation #ar_dx bacaptmh_tmp -= @s bacaptmh_arx
scoreboard players operation #ar_dz bacaptmh_tmp -= @s bacaptmh_arz
execute if score #ar_dx bacaptmh_tmp matches 6000.. run scoreboard players set #ar_dx bacaptmh_tmp 6000
execute if score #ar_dx bacaptmh_tmp matches ..-6000 run scoreboard players set #ar_dx bacaptmh_tmp -6000
execute if score #ar_dz bacaptmh_tmp matches 6000.. run scoreboard players set #ar_dz bacaptmh_tmp 6000
execute if score #ar_dz bacaptmh_tmp matches ..-6000 run scoreboard players set #ar_dz bacaptmh_tmp -6000
scoreboard players operation #ar_dx bacaptmh_tmp *= #ar_dx bacaptmh_tmp
scoreboard players operation #ar_dz bacaptmh_tmp *= #ar_dz bacaptmh_tmp
scoreboard players operation #ar_d bacaptmh_tmp = #ar_dx bacaptmh_tmp
scoreboard players operation #ar_d bacaptmh_tmp += #ar_dz bacaptmh_tmp
execute if score #ar_d bacaptmh_tmp > @s bacaptmh_armax run scoreboard players operation @s bacaptmh_armax = #ar_d bacaptmh_tmp
# Back on the start line after 5000 blocks out stamps a finish time.
execute store result score #ar_now bacaptmh_tmp run time query gametime
execute if score @s bacaptmh_armax matches 25000000.. if score #ar_d bacaptmh_tmp matches ..9 run scoreboard players operation @s bacaptmh_art = #ar_now bacaptmh_tmp
scoreboard players operation #ar_cut bacaptmh_tmp = #ar_now bacaptmh_tmp
scoreboard players remove #ar_cut bacaptmh_tmp 1200
execute unless score @s bacaptmh_art > #ar_cut bacaptmh_tmp run return 0
tag @a remove bacaptmh_ar_mate
tag @s add bacaptmh_ar_self
execute as @a[gamemode=!spectator,gamemode=!creative,tag=!bacaptmh_ar_self,distance=..3,scores={bacaptmh_armax=25000000..}] if score @s bacaptmh_art > #ar_cut bacaptmh_tmp run tag @s add bacaptmh_ar_mate
tag @s remove bacaptmh_ar_self
execute if entity @a[tag=bacaptmh_ar_mate,limit=1] run advancement grant @s only bacaptmh:statistics/the_amazing_race
execute if entity @a[tag=bacaptmh_ar_mate,limit=1] run advancement grant @a[tag=bacaptmh_ar_mate] only bacaptmh:statistics/the_amazing_race
tag @a remove bacaptmh_ar_mate
