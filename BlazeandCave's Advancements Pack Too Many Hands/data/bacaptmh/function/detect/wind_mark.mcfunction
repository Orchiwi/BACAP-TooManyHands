# run as the thrower, positioned at his charge. The owner tag makes a self-launch
# impossible; creative, spectator and already-gliding players are never marked, and a
# player with a window already open is not re-based while it runs.
scoreboard players operation #wdwho bacaptmh_sys = @s bacaptmh_pid
tag @s add bacaptmh_wd_owner
execute if score #wdwho bacaptmh_sys matches 1.. as @a[tag=!bacaptmh_wd_owner,distance=..3.5,gamemode=!spectator,gamemode=!creative] unless entity @s[nbt={FallFlying:1b}] unless score @s bacaptmh_wd_timer matches 1.. run function bacaptmh:detect/wind_base
tag @s remove bacaptmh_wd_owner
