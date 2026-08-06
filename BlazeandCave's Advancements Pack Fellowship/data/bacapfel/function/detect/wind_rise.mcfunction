# one second of window, which is about what a wind burst's arc takes: long enough for
# the launch, too short to climb six blocks by jumping up blocks, by ladder or by rocket
scoreboard players remove @s bacapfel_wd_timer 1
# a player who starts gliding inside the window is dropped - an Elytra climb is not a launch
execute if entity @s[nbt={FallFlying:1b}] run scoreboard players set @s bacapfel_wd_timer 0
execute store result score @s bacapfel_wd_now run data get entity @s Pos[1] 100
scoreboard players operation @s bacapfel_wd_now -= @s bacapfel_wd_base
execute if score @s bacapfel_wd_timer matches 1.. if score @s bacapfel_wd_now matches 600.. run function bacapfel:detect/wind_pay
