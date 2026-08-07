# Four players within 16 blocks carrying an identical signature, at least three deep.
# Pure score comparison - no NBT is touched here at all.
scoreboard players operation #gbm bacaptmh_tmp4 = @s bacaptmh_gbm
scoreboard players set #gbn bacaptmh_tmp4 0
execute as @a[gamemode=!spectator,distance=..16] if score @s bacaptmh_gbm = #gbm bacaptmh_tmp4 run scoreboard players add #gbn bacaptmh_tmp4 1
execute if score #gbn bacaptmh_tmp4 matches 4.. as @a[gamemode=!spectator,distance=..16] if score @s bacaptmh_gbm = #gbm bacaptmh_tmp4 run advancement grant @s only bacaptmh:potion/group_buff
