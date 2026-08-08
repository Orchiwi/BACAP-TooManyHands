# Run as B. #ps* is A's launch point, #pc* is A's position now. B qualifies when B now
# stands on A's launch point AND A now stands on B's launch point, both within 3 blocks.
execute store result score #pdx bacaptmh_tmp run data get entity @s Pos[0] 1
execute store result score #pdy bacaptmh_tmp run data get entity @s Pos[1] 1
execute store result score #pdz bacaptmh_tmp run data get entity @s Pos[2] 1
scoreboard players operation #pdx bacaptmh_tmp -= #psx bacaptmh_tmp
scoreboard players operation #pdy bacaptmh_tmp -= #psy bacaptmh_tmp
scoreboard players operation #pdz bacaptmh_tmp -= #psz bacaptmh_tmp
scoreboard players operation #pgx bacaptmh_tmp = #pcx bacaptmh_tmp
scoreboard players operation #pgy bacaptmh_tmp = #pcy bacaptmh_tmp
scoreboard players operation #pgz bacaptmh_tmp = #pcz bacaptmh_tmp
scoreboard players operation #pgx bacaptmh_tmp -= @s bacaptmh_px
scoreboard players operation #pgy bacaptmh_tmp -= @s bacaptmh_py
scoreboard players operation #pgz bacaptmh_tmp -= @s bacaptmh_pz
scoreboard players set #pok bacaptmh_tmp 0
execute if score #pdx bacaptmh_tmp matches -3..3 if score #pdy bacaptmh_tmp matches -3..3 if score #pdz bacaptmh_tmp matches -3..3 if score #pgx bacaptmh_tmp matches -3..3 if score #pgy bacaptmh_tmp matches -3..3 if score #pgz bacaptmh_tmp matches -3..3 run scoreboard players set #pok bacaptmh_tmp 1
# Both windows are closed before the grants, so the pair cannot be re-counted next tick.
execute if score #pok bacaptmh_tmp matches 1 run scoreboard players set @s bacaptmh_pw 0
execute if score #pok bacaptmh_tmp matches 1 run scoreboard players set @a[tag=bacaptmh_pswap] bacaptmh_pw 0
execute if score #pok bacaptmh_tmp matches 1 run advancement grant @a[tag=bacaptmh_pswap] only bacaptmh:end/pearl_swap
execute if score #pok bacaptmh_tmp matches 1 run advancement grant @s only bacaptmh:end/pearl_swap
