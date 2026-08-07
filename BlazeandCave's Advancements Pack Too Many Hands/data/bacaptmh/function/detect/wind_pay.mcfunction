# credit exactly the thrower this player was marked by, and nobody else
scoreboard players set @s bacaptmh_wd_timer 0
scoreboard players operation #wdwho bacaptmh_sys = @s bacaptmh_wd_from
tag @s add bacaptmh_wd_victim
execute if score #wdwho bacaptmh_sys matches 1.. as @a[tag=!bacaptmh_wd_victim,gamemode=!spectator,advancements={bacaptmh:weaponry/wind_duel=false}] if score @s bacaptmh_pid = #wdwho bacaptmh_sys run advancement grant @s only bacaptmh:weaponry/wind_duel
tag @s remove bacaptmh_wd_victim
