# Executed as and at a player who has just placed a block (fast bucket).
# Look for a DIFFERENT survival player standing in a sealed pocket: the floor, the
# ceiling above his head and the four sides of his feet block must all be real blocks.
# Only literal ids are tested - no block tag is used here on purpose, because an unknown
# tag is a PARSE error and would take this entire function file down with it.
# 'place' is an EVENT, not a latch. Consuming it here is what bounds this file's cost:
# left latched it stayed true for the rest of the world's life, so the thirty block tests
# below ran every tick forever and any player who ever wandered into a one-block shaft was
# read as 'sealed' with no link at all to the block that was just placed.
advancement revoke @s only bacaptmh:building/bricked_in place
tag @a[tag=bacaptmh_walled] remove bacaptmh_walled
execute as @a[gamemode=!spectator,gamemode=!creative,distance=1..8] at @s unless block ~ ~-1 ~ minecraft:air unless block ~ ~-1 ~ minecraft:cave_air unless block ~ ~-1 ~ minecraft:void_air unless block ~ ~-1 ~ minecraft:water unless block ~ ~-1 ~ minecraft:lava unless block ~ ~2 ~ minecraft:air unless block ~ ~2 ~ minecraft:cave_air unless block ~ ~2 ~ minecraft:void_air unless block ~ ~2 ~ minecraft:water unless block ~ ~2 ~ minecraft:lava unless block ~1 ~ ~ minecraft:air unless block ~1 ~ ~ minecraft:cave_air unless block ~1 ~ ~ minecraft:void_air unless block ~1 ~ ~ minecraft:water unless block ~1 ~ ~ minecraft:lava unless block ~-1 ~ ~ minecraft:air unless block ~-1 ~ ~ minecraft:cave_air unless block ~-1 ~ ~ minecraft:void_air unless block ~-1 ~ ~ minecraft:water unless block ~-1 ~ ~ minecraft:lava unless block ~ ~ ~1 minecraft:air unless block ~ ~ ~1 minecraft:cave_air unless block ~ ~ ~1 minecraft:void_air unless block ~ ~ ~1 minecraft:water unless block ~ ~ ~1 minecraft:lava unless block ~ ~ ~-1 minecraft:air unless block ~ ~ ~-1 minecraft:cave_air unless block ~ ~ ~-1 minecraft:void_air unless block ~ ~ ~-1 minecraft:water unless block ~ ~ ~-1 minecraft:lava run tag @s add bacaptmh_walled
# Both sides of the joke get it: the bricklayer (@s here) and everyone he sealed in.
execute if entity @a[tag=bacaptmh_walled,limit=1] run advancement grant @s only bacaptmh:building/bricked_in
advancement grant @a[tag=bacaptmh_walled] only bacaptmh:building/bricked_in
tag @a[tag=bacaptmh_walled] remove bacaptmh_walled
