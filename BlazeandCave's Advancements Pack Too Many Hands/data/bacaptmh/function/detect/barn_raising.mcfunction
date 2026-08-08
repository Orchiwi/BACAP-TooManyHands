# Reached once per block placed. 'place' is only an event flag: requirements are
# [["place"],["impossible"]], which names every criterion (so the file loads) while
# still being uncompletable without a command grant. The bucket selector demands
# impossible=false, so a finished advancement is never re-entered and this revoke can
# never un-complete one.
advancement revoke @s only bacaptmh:building/barn_raising place

# Chunk key. Read the coordinate at 1/16-block precision and floor-divide by 256, because
# scoreboard /= is floorDiv while 'data get' truncates toward zero. Scaling by 1 first
# threw the sub-block part away, so every coordinate in (-1,0) truncated to 0 and keyed as
# chunk 0 while the player was really in chunk -1; two builders one block apart along that
# strip got different keys and the group match silently broke. Keeping the fraction inside
# the value being floor-divided rounds negatives correctly, and 30M * 16 is well inside
# int range, so the wider intermediate cannot overflow.
scoreboard players set #c256 bacaptmh_tmp4 256
execute store result score #bx bacaptmh_tmp4 run data get entity @s Pos[0] 16
execute store result score #bz bacaptmh_tmp4 run data get entity @s Pos[2] 16
scoreboard players operation #bx bacaptmh_tmp4 /= #c256 bacaptmh_tmp4
scoreboard players operation #bz bacaptmh_tmp4 /= #c256 bacaptmh_tmp4

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
