# A7 The Wave - four different players jump in sequence, each inside 10 ticks of the
# last. The jump mirror is resynced by an ungated line in bucket_fast every single tick,
# so it can never go stale while this function is skipped and then read as a burst of
# simultaneous jumps.
execute store result score #n bacaptmh_n if entity @a[gamemode=!spectator,gamemode=!creative]
execute if score #t bacaptmh_wave matches 1.. run scoreboard players remove #t bacaptmh_wave 1
execute if score #t bacaptmh_wave matches 0 run function bacaptmh:detect/wave_reset
execute if score #n bacaptmh_n matches ..3 if score #c bacaptmh_wave matches 1.. run function bacaptmh:detect/wave_reset
execute if score #n bacaptmh_n matches ..3 run return 0
execute as @a[gamemode=!spectator,gamemode=!creative,tag=!bacaptmh_wave] if score @s bacaptmh_jump > @s bacaptmh_jumpp run function bacaptmh:detect/wave_add
execute if score #c bacaptmh_wave matches 4.. run function bacaptmh:detect/wave_win
