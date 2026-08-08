# Reached only once four players are all standing in the Nether inside the same twenty-second
# post-death window and within eight blocks of each other, so a block sweep is affordable
# here in a way it never would be per player per tick.
# A Respawn Anchor puts a player back on their feet within a block or two of itself, so a
# 5x5x3 box around the one who tripped the check either contains the anchor they all came
# back on or there was no anchor and the four of them walked back in through a portal.
# Literal id, never a block tag: an unknown tag is a PARSE error and takes the file down.
scoreboard players set #bba bacaptmh_mp6 0
execute if block ~-2 ~-1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~-1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~-1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~-1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~-1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~-1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~-1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~-1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~-1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~-1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~-1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~-1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~-1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~-1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~-1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~-1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~-1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~-1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~-1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~-1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~-1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~-1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~-1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~-1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~-1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~ ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~ ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~ ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~ ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~ ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~ ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~ ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~ ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~ ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~ ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~ ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~ ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~ ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~ ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~ ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~ ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~ ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~ ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~ ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~ ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~ ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~ ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~ ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~ ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~ ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-2 ~1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~-1 ~1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~ ~1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~1 ~1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~1 ~-2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~1 ~-1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~1 ~ minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~1 ~1 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if block ~2 ~1 ~2 minecraft:respawn_anchor run scoreboard players set #bba bacaptmh_mp6 1
execute if score #bba bacaptmh_mp6 matches 1 run advancement grant @a[gamemode=!spectator,distance=..8,scores={bacaptmh_bb=1..},nbt=!{Health:0.0f}] only bacaptmh:challenges/blood_brothers
