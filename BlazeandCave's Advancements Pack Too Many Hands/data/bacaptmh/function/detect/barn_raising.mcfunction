# Reached once per block placed. 'place' is only an event flag: requirements are
# [["place"],["impossible"]], which names every criterion (so the file loads) while
# still being uncompletable without a command grant. The bucket selector demands
# impossible=false, so a finished advancement is never re-entered and this revoke can
# never un-complete one.
advancement revoke @s only bacaptmh:building/barn_raising place

# Chunk key. Read the raw coordinate and floor-divide, because scoreboard /= is floorDiv;
# scaling by 0.0625 in 'data get' truncates toward zero and turns every x in (-16,16)
# into a single 32-block bucket.
scoreboard players set #c16 bacaptmh_tmp4 16
execute store result score #bx bacaptmh_tmp4 run data get entity @s Pos[0] 1
execute store result score #bz bacaptmh_tmp4 run data get entity @s Pos[2] 1
scoreboard players operation #bx bacaptmh_tmp4 /= #c16 bacaptmh_tmp4
scoreboard players operation #bz bacaptmh_tmp4 /= #c16 bacaptmh_tmp4

# Dimension is part of the key, so chunk (5,5) in three worlds is three chunks.
scoreboard players set #bd bacaptmh_tmp4 0
execute if dimension minecraft:the_nether run scoreboard players set #bd bacaptmh_tmp4 1
execute if dimension minecraft:the_end run scoreboard players set #bd bacaptmh_tmp4 2

# Leaving the chunk (or the dimension) resets the tally
execute unless score @s bacaptmh_cx = #bx bacaptmh_tmp4 run scoreboard players set @s bacaptmh_barn 0
execute unless score @s bacaptmh_cz = #bz bacaptmh_tmp4 run scoreboard players set @s bacaptmh_barn 0
execute unless score @s bacaptmh_cd = #bd bacaptmh_tmp4 run scoreboard players set @s bacaptmh_barn 0
scoreboard players operation @s bacaptmh_cx = #bx bacaptmh_tmp4
scoreboard players operation @s bacaptmh_cz = #bz bacaptmh_tmp4
scoreboard players operation @s bacaptmh_cd = #bd bacaptmh_tmp4

scoreboard players add @s bacaptmh_barn 1
execute if score @s bacaptmh_barn matches 100.. run function bacaptmh:detect/barn_raising_group
