# credit exactly the thrower this player was marked by, and nobody else
scoreboard players set @s bacapfel_wd_timer 0
scoreboard players operation #wdwho bacapfel_sys = @s bacapfel_wd_from
tag @s add bacapfel_wd_victim
execute if score #wdwho bacapfel_sys matches 1.. as @a[tag=!bacapfel_wd_victim,gamemode=!spectator,advancements={bacapfel:weaponry/wind_duel=false}] if score @s bacapfel_pid = #wdwho bacapfel_sys run advancement grant @s only bacapfel:weaponry/wind_duel
tag @s remove bacapfel_wd_victim
