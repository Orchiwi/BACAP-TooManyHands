# Executed as/at a player who has just enchanted an item, with at least one OTHER player
# within sixteen blocks whose bookshelf-placement window is still open. That pairing alone
# proved nothing about where the shelves went: they could be in another dimension. The
# enchant itself proves a table is here, so all that is left to check is that the shelves
# are here too. Sweep a 5x5x3 box around the enchanter - a table is one block away and its
# ring sits two blocks out from the table, so a real ring lands well inside this box.
# Literal id, never a block tag: an unknown tag is a PARSE error and takes the file down.
scoreboard players set #rtr bacaptmh_tmp 0
execute if block ~-2 ~-1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~-1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~-1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~-1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~-1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~-1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~-1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~-1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~-1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~-1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~-1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~-1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~-1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~-1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~-1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~-1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~-1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~-1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~-1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~-1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~-1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~-1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~-1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~-1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~-1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~ ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~ ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~ ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~ ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~ ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~ ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~ ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~ ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~ ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~ ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~ ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~ ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~ ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~ ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~ ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~ ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~ ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~ ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~ ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~ ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~ ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~ ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~ ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~ ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~ ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-2 ~1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~-1 ~1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~ ~1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~1 ~1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~1 ~-2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~1 ~-1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~1 ~ minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~1 ~1 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
execute if block ~2 ~1 ~2 minecraft:bookshelf run scoreboard players add #rtr bacaptmh_tmp 1
# Six shelves in the box is a table that has been ringed, not a table standing bare.
execute if score #rtr bacaptmh_tmp matches 6.. run advancement grant @a[distance=1..16,gamemode=!spectator,scores={bacaptmh_m1shelfw=1..}] only bacaptmh:enchanting/read_the_room
execute if score #rtr bacaptmh_tmp matches 6.. run advancement grant @s only bacaptmh:enchanting/read_the_room
