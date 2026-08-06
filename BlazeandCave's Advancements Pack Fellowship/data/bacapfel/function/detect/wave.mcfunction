# A7 The Wave - four different players jump in sequence, each inside 10 ticks of the
# last. The jump mirror is resynced by an ungated line in bucket_fast every single tick,
# so it can never go stale while this function is skipped and then read as a burst of
# simultaneous jumps.
execute store result score #n bacapfel_n if entity @a[gamemode=!spectator,gamemode=!creative]
execute if score #t bacapfel_wave matches 1.. run scoreboard players remove #t bacapfel_wave 1
execute if score #t bacapfel_wave matches 0 run function bacapfel:detect/wave_reset
execute if score #n bacapfel_n matches ..3 if score #c bacapfel_wave matches 1.. run function bacapfel:detect/wave_reset
execute if score #n bacapfel_n matches ..3 run return 0
execute as @a[gamemode=!spectator,gamemode=!creative,tag=!bacapfel_wave] if score @s bacapfel_jump > @s bacapfel_jumpp run function bacapfel:detect/wave_add
execute if score #c bacapfel_wave matches 4.. run function bacapfel:detect/wave_win
