# Executed as and at a player who has just used a Compass on a Lodestone while a hand-over
# window of his is still open. The Lodestone has to be at least sixty-four blocks from where
# the Compass changed hands, so right-clicking the Lodestone in your own base with a Compass
# out of your own crafting table is no longer the whole task.
# Both deltas are clamped to 1000 before squaring, so the multiply cannot overflow a 32-bit
# score; 64 blocks squared is 4096.
execute store result score #hp_x bacaptmh_tmp run data get entity @s Pos[0]
execute store result score #hp_z bacaptmh_tmp run data get entity @s Pos[2]
scoreboard players operation #hp_x bacaptmh_tmp -= @s bacaptmh_hpx
scoreboard players operation #hp_z bacaptmh_tmp -= @s bacaptmh_hpz
execute if score #hp_x bacaptmh_tmp matches 1000.. run scoreboard players set #hp_x bacaptmh_tmp 1000
execute if score #hp_x bacaptmh_tmp matches ..-1000 run scoreboard players set #hp_x bacaptmh_tmp -1000
execute if score #hp_z bacaptmh_tmp matches 1000.. run scoreboard players set #hp_z bacaptmh_tmp 1000
execute if score #hp_z bacaptmh_tmp matches ..-1000 run scoreboard players set #hp_z bacaptmh_tmp -1000
scoreboard players operation #hp_x bacaptmh_tmp *= #hp_x bacaptmh_tmp
scoreboard players operation #hp_z bacaptmh_tmp *= #hp_z bacaptmh_tmp
scoreboard players operation #hp_x bacaptmh_tmp += #hp_z bacaptmh_tmp
execute if score #hp_x bacaptmh_tmp matches 4096.. run scoreboard players set @s bacaptmh_hpw 0
execute if score #hp_x bacaptmh_tmp matches 4096.. run advancement grant @s only bacaptmh:mining/homing_pigeon
